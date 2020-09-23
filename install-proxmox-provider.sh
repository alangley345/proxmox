#!/bin/bash

#install go if not already installed
sudo dnf install go

sudo git clone https://github.com/Telmate/terraform-provider-proxmox.git /opt/teraform-provider-proxmox

#install provider and provisioner
sudo go install /opt/terraform-provider-proxmox/cmd/terraform-provider-proxmox
sudo go install /opt/terraform-provider-proxmox/cmd/terraform-provisioner-proxmox

make

#Copy executable to plugin
mkdir ~/.terraform.d/plugins
cp /opt/terraform-provider-proxmox/bin/terraform-provider-proxmox ~/.terraform.d/plugins
cp /opt/terraform-provider-proxmox/bin/terraform-provisioner-proxmox ~/.terraform.d/plugins

rm -Rf /opt/terraform-provider-plugin