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
conda create -n scistack pandas matplotlib bokeh seaborn scipy scikit-learn ipython ipykernel
jupyter-add scistack

##################
# R AND R-STUDIO #
##################

sudo apt-get install r-base
sudo apt-get install r-recommended

# R studio (02.10.17)
sudo add-apt-repository ppa:aims/aims-desktop
sudo apt-get update
sudo apt-get install rstudio-upstream-deb
