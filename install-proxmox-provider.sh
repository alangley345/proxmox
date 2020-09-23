#!/bin/bash

#install go if not already installed
sudo dnf install go

#install provider and provisioner
sudo go install github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provider-proxmox
sudo go install github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provisioner-proxmox

make

#Copy executable to plugin
mkdir ~/.terraform.d/plugins
cp bin/terraform-provider-proxmox ~/.terraform.d/plugins
cp bin/terraform-provisioner-proxmox ~/.terraform.d/plugins