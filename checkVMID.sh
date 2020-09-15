#!/bin/bash
#simple bash script to determine if a Proxmox VMID is free by prompting user for id no and grepping for it.

echo "Which ID do you want to check for?"
read id1

#grep for the read in value, select the first word in the returned list and trim the double quotes and colon 

if [grep $id1 /etc/pve/.vmlist | awk '{print $1;}' | tr -d "\"":=$id]
    then
        echo "TRUE"
fi