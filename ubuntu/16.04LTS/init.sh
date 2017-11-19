# INIT FILE - SYSTEM SETUP - Ubuntu 16.04 LTS
#
# Start this file to initialize system setup.
#

################
# SETUP BASHRC #
################

cat setup_bashrc.sh >> ~/.bashrc
source ~/.bashrc

####################
# UPDATE / UPGRADE #
####################

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

################
# SYSTEM TOOLS #
################ 

sudo apt-get install vim # (26.09.17)
sudo apt-get install gparted # (26.09.17)
sudo apt-get install libcurl4-openssl-dev libssl-dev # required for curl openssl (02.10.17)
sudo apt-get install git # (04.10.17)

##############
# INDICATORS #
##############

sudo apt-get install indicator-multiload
indicator-multiload

##################
# SETUP SETTINGS #
##################

source setup_settings.sh

###################
# SETUP SCI-STACK #
###################

source setup_sci_stack.sh
