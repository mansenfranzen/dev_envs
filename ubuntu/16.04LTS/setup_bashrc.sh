# SETUP BASHRC
#
# Modifies bashrc adding environment variables, 
# jupyter functions and radio streams ;-).
#

#########################
# DEFINE PATH CONSTANTS #
#########################

export LINUX_HOME="/media/franne/LinuxHome/"
export PYTHON_HOME=$LINUX_HOME"Franz/python/"

export CONDA_HOME=$PYTHON_HOME"conda/"
export CONDA_ENV_PATH=$CONDA_HOME"envs/"

export JUPYTER_START_DIR=$PYTHON_HOME"projects/"
export CONDA_JUPYTER_NAME="jupyter"


############################
# DEFINE JUPYTER FUNCTIONS #
############################

function jupyter-start {
   $CONDA_ENV_PATH$1/bin/python -m ipykernel install --user --name $1
}

function jupyter-add {
   $CONDA_ENV_PATH$CONDA_JUPYTER_NAME/bin/jupyter-notebook --notebook-dir=$JUPYTER_START_DIR
}


#####################
# DEFINE RADIO URLS #
#####################

BAYERN1="http://www.br.de/static/radioplayer/player.html#/mediathek/audio/audio-livestream-bayern1-oberbayern-100~radioplayer.json"
SWR1="https://www.swr.de/swr1/bw/-/id=233362/did=7656/nid=233362/pv=mplayer/1gkbgoj/index.html"

# RADIO STREAMS
alias bayern1='firefox $BAYERN1'
alias swr1='firefox $SWR1'


#
# END ADDED VIA SETUP SCRIPT
#
