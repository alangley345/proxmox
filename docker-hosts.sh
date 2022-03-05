#!/usr/bin/bash

domain="int.greatcatlab.net"
template="9001"
gw6="2001:470:e107:1010::1"
netAdd="2001:470:e107:1010"
numHosts=3
hostPrefix="docker"

#########################################
j=1
while [ $j -le $numHosts ];
do
    id="`pvesh get /cluster/nextid`"

    qm clone $template $id --full --name $hostPrefix$j$domain
    wait
    qm set $id --ipconfig0 ip6=$netAdd:$id::/64,gw6=$gw6
    wait
    qm resize $id scsi0 20G
    wait
    qm set $id --onboot=1
    wait
    echo "VM `$id` is ready!"
done

