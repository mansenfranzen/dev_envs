# SETUP BASHRC
#
# Modifies bashrc adding environment variables, 
# jupyter functions and radio streams ;-).
#

#########################
# DEFINE PATH CONSTANTS #
#########################

LINUX_HOME="/media/franne/LinuxHome/"
PYTHON_HOME=$LINUX_HOME"Franz/python/"

CONDA_HOME=$PYTHON_HOME"conda/"
CONDA_ENV_PATH=$CONDA_HOME"envs/"

JUPYTER_START_DIR=$PYTHON_HOME"projects/"

#################################
# DEFINE JUPYTER FUNCTION NAMES #
#################################

CONDA_JUPYTER_NAME="jupyter"
JUPYTER_FUNC_START="jupyter-start"
JUPYTER_FUNC_ADD="jupyter-add"

#####################
# DEFINE RADIO URLS #
#####################

BAYERN1="http://www.br.de/static/radioplayer/player.html#/mediathek/audio/audio-livestream-bayern1-oberbayern-100~radioplayer.json"
SWR1="https://www.swr.de/swr1/bw/-/id=233362/did=7656/nid=233362/pv=mplayer/1gkbgoj/index.html"

#################
# ADD TO BASHRC #
#################

DATE=`date '+%Y-%m-%d %H:%M:%S'`

echo "
#
# ADDED VIA SETUP SCRIPT $DATE
#

# RADIO STREAMS
alias bayern1='firefox $BAYERN1'
alias swr1='firefox $SWR1'

# ENV VARIABLES
export CONDA_ENV_PATH=$CONDA_ENV_PATH

# CONDA FUNCS
function $JUPYTER_FUNC_ADD {
   $CONDA_ENV_PATH\$1/bin/python -m ipykernel install --user --name \$1
}

function $JUPYTER_FUNC_START {
   $CONDA_ENV_PATH$CONDA_JUPYTER_NAME/bin/jupyter-notebook --notebook-dir=$JUPYTER_START_DIR
}

#
# END ADDED VIA SETUP SCRIPT
#
" >> ~/.bashrc
