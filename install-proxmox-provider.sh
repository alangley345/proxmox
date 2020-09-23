#!/bin/bash

#install go if not already installed
sudo dnf install go

#clone github repo and cd into it
git clone https://github.com/Telmate/terraform-provider-proxmox.git
cd terraform-provider-proxmox

#install provider and provisioner
go install terraform-provider-proxmox/cmd/terraform-provider-proxmox
go install terraform-provider-proxmox/cmd/terraform-provisioner-proxmox

make

#Copy executable to plugin
mkdir ~/.terraform.d/plugins
cp ./bin/terraform-provider-proxmox ~/.terraform.d/plugins
cp ./bin/terraform-provisioner-proxmox ~/.terraform.d/plugins

#rm -Rf terraform-provider-plugin