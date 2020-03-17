#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
	RED "You must run this script as root!" && echo
	exit
fi



BLUE "Updating repositories..."
sudo apt update

BLUE "Installing git..."
sudo apt install -y git

BLUE "Installing pip..."
sudo apt-get install -y python-pip

BLUE "Installing openvpn..."
sudo apt-get install -y openvpn

BLUE "Installing nmap..."
sudo apt-get install -y nmap

BLUE "Installing docker..."
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `janak`

BLUE "Installing curl..."
sudo apt-get install -y curl

BLUE "Installing exiftool..."
sudo apt-get install -y exiftool

BLUE "Installing xclip..."
sudo apt install -y xclip
grep "alias xclip" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "alias xclip='xclip -selection clipboard'" >> ~/.bashrc
fi

BLUE "Installing Oracle Java 8..."
echo "" | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

BLUE "Installing unrar..."
sudo apt install -y unrar

BLUE "Installing cmake..."
sudo apt install -y cmake

BLUE "Installing openssh-server..."
sudo apt install -y openssh-server

BLUE "Installing vim..."
sudo apt-get install -y vim

BLUE "Installing adb & fastboot..."
sudo apt update
sudo apt install -y android-tools-adb android-tools-fastboot

BLUE "Installing gedit..."
sudo apt-get install -y gedit

BLUE "Installing Gcc..."
sudo apt install -y gcc

BLUE "Installing VSCode..."
wget -qo - https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

BLUE "Installing vlc..."
echo "" | sudo add-apt-repository ppa:videolan/stable-daily
sudo apt-get update
sudo apt-get install -y vlc

BLUE "Installing Nodejs..."
sudo apt update
sudo apt install -y nodejs


