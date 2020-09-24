#!/bin/bash

#install wget
sudo dnf -y install wget
sudo dnf -y install unzip

#install Terraform
TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest |  grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip

#unzip
unzip terraform_${TER_VER}_linux_amd64.zip

#mv terraform folder
sudo mv terraform /usr/local/bin/

#out terraform version
terraform version

