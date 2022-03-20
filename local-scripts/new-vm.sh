#!/bin/bash

# get ID
read -p "ID? " id

# get VM name
read -p "VM name? " name

# get RAM amount
read -p "RAM in MB? " mem

# get sockets
read -p "Number of Sockets? " sockets

# get cores
read -p "How many cores? " cores

#first network adapter settings
read -p "Which bridge? " bridge

read -p "Which VLAN? " vlan

echo "qm create $id --name $name --memory $mem --sockets $sockets --cores $cores --net0 virtio,bridge=$bridge,vlan=$vlan"
#qm set 9000 --agent enabled=1