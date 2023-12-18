#!/usr/bin/bash

sudo apt-get -y update && apt-get -y upgrade

sudo apt -y install software-properties-common
sudo apt -y install gcc g++ make
sudo apt install curl -y
sudo apt install wget -y
wget --version

# stacer
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt -y update
sudo apt -y install stacer

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y

# install nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source ~/.bashrc 
nvm install node -y
nvm install 18

# install git
sudo apt install git -y
git --version

# docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get -y update
sudo apt-get -y install \
	ca-certificates \
	curl \
	gnupg \
	lsb-release
sudo apt -y install docker.io
sudo docker --version

# postgres & pgadmin
sudo apt -y update
sudo apt -y install postgresql postgresql-contrib
sudo systemctl start postgresql.service
sudo systemctl status postgresql.service
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt -y install pgadmin4

# idea
sudo apt -y update
sudo apt -y install vim apt-transport-https curl wget software-properties-common
sudo add-apt-repository ppa:mmk2410/intellij-idea -y
sudo apt -y install intellij-idea-community -y

# pycharm
sudo snap install pycharm-community --classic

# postman
sudo snap install postman

# vscode
sudo snap install --classic code
code --version

# zoom
sudo snap install zoom-client

# ngrok
sudo snap install ngrok

# python
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get -y update
sudo apt-get -y install python3.8
sudo apt -y install python3-pip
sudo apt -y install python3-virtualenv
sudo apt -y install libpq-dev python3-dev
python --version

# putty
sudo apt-get -y install putty-tools

# redis
sudo snap install redis
sudo snap install another-redis-desktop-manager
