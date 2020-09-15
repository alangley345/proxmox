#!/bin/bash
#simple bash script to determine if a Proxmox VMID is free by prompting user for id no and grepping for it.

echo "Which ID do you want to check for?"
read id1

grep $id1 /etc/pve/.vmlist | awk '{print $1;}