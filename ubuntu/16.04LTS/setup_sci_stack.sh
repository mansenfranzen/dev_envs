# SETUP SCI STACK
#
# Install required libraries for scientific stack.
#

########################
# INSTALL PYTHON/CONDA #
########################

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh # (04.10.17)
bash Miniconda3-latest-Linux-x86_64.sh # choose directory corresponding to CONDA_HOME
rm Miniconda3-latest-Linux-x86_64.sh # remove install file again

# add conda-forge
source .bashrc # activate conda
conda config --add channels conda-forge

# create jupyter envs
conda create -n jupyter jupyter notebook
conda create -n scistack pandas matplotlib bokeh seaborn scipy scikit-learn ipykernel
conda create -n py27 python=2.7 ipykernel

jupyter-add py27
jupyter-add scistack

###########
# Add JDK #
###########

sudo apt-get install openjdk-8-jdk openjdk-8-demo openjdk-8-doc openjdk-8-jre-headless openjdk-8-source 

#############
# ADD SPARK #
#############

SPARK_VERSION="2.2.0"

wget https://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VERSION-bin-hadoop2.7.tgz
sudo tar xf spark-$SPARK_VERSION-bin-hadoop2.7.tgz -C /opt/
rm spark-$SPARK_VERSION-bin-hadoop2.7.tgz

sudo ln -s /opt/spark-$SPARK_VERSION-bin-hadoop2.7 /opt/spark

echo "
# Add Spark links
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH

" >> ~/.bashrc

################################################
# Add Scistack Kernel with PySpark Integration #
################################################

PY4J_VERSION="0.10.4"

# create ipython profile which contains spark setup script
# which is run before kernel becomes available in jupyter

$CONDA_ENV_PATH/scistack/bin/ipython profile create pyspark

echo "
import os
import sys

spark_home = '/opt/spark/'
os.environ['SPARK_HOME'] = spark_home
sys.path.insert(0, spark_home + '/python')
sys.path.insert(0, os.path.join(spark_home, 'python/lib/py4j-$PY4J_VERSION-src.zip'))

pyspark_submit_args = os.environ.get('PYSPARK_SUBMIT_ARGS', "")
pyspark_submit_args += ' pyspark-shell'
os.environ['PYSPARK_SUBMIT_ARGS'] = pyspark_submit_args

filename = os.path.join(spark_home, 'python/pyspark/shell.py')
exec(compile(open(filename, 'rb').read(), filename, 'exec'))
" >> ~/.ipython/profile_pyspark/startup/setup_pyspark.py


# add additional kernel configuration to jupyter which
# references the scistack interpreter and pyspark profile

mkdir ~/.local/share/jupyter/kernels/pyspark

echo "
{
  \"display_name\": \"SciStackPySpark\",
  \"language\": \"python\",
  \"argv\": [
    \"$CONDA_ENV_PATH/scistack/bin/python\",
    \"-m\", \"ipykernel\",
    \"--profile=pyspark\",
    \"-f\", \"{connection_file}\"
  ],
  \"env\": {
    \"PYSPARK_SUBMIT_ARGS\": \"\"
  }
}
" >> ~/.local/share/jupyter/kernels/pyspark/kernel.json


###############
# Add PyCharm #
###############

PYCHARM_VERSION="2017.2.3"

wget https://download.jetbrains.com/python/pycharm-community-$PYCHARM_VERSION.tar.gz # (17.10.2017)
sudo tar xf pycharm-community-$PYCHARM_VERSION.tar.gz -C /opt/
rm pycharm-community-$PYCHARM_VERSION.tar.gz

# add symbolic link
sudo ln -s /opt/pycharm-community-$PYCHARM_VERSION/bin/pycharm.sh /usr/bin/pycharm

##################
# R AND R-STUDIO #
##################

sudo apt-get install r-base
sudo apt-get install r-recommended

# R studio (02.10.17)
sudo add-apt-repository ppa:aims/aims-desktop
sudo apt-get update
sudo apt-get install rstudio-upstream-deb
