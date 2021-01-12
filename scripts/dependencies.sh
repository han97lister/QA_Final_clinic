#!/bin/bash 

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Running Prerequisites"
sudo apt update
sudp apt-get -y upgrade
sudo apt install -y curl
sudo apt install -y unzip wget
#sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null
#sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq ca-certificates jq curl apt-transport-https lsb-release gnupg nodejs git openjdk-8-jre maven unzip< /dev/null > /dev/null

echo "Installing npm"
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash

echo "Installing Azure-CLI"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "Installing Terraform"
wget https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin

echo "Install Docker"
curl https://get.docker.com | sudo bash

echo "Install Docker Compose"
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Installing kubectl"
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo mv kubectl /usr/local/bin/kubectl
sudo chmod a+x /usr/local/bin/kubectl

echo "Refrshing Angular"
sudo npm uninstall -g angular-cli @angular/cli
sudo npm cache clean
sudo npm install -g @angular/cli@latest

echo "Installing Testing Frameworks"
sudo npm install karma 
sudo npm install -g protractor

echo "installing java"
sudo apt install -y default-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
