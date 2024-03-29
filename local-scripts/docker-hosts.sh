#!/usr/bin/bash

domain="int.greatcatlab.net"
template="9001"
gw6="2001:470:e107:1010::1"
netAdd="2001:470:e107:1010"
numHosts=1


hostPrefix="docker"
googleDNS1="2001:4860:4860::8888"
googleDNS2="2001:4860:4860::8844"
ciuser="docker"
sshkey=20220309_ansible.pub
cicustom="user=local:snippets/docker-host.yml"

#########################################
j=1
while [ $j -le $numHosts ];
do
    id="`pvesh get /cluster/nextid`"

    qm clone $template $id --full --name $hostPrefix$j.$domain
    wait 
    qm set $id --ipconfig0 ip6=$netAdd:$id::/64,gw6=$gw6 --nameserver "$googleDNS1 $googleDNS1" --searchdomain $domain --sshkey $sshkey --ciuser $ciuser #--cicustom $cicustom
    wait
    qm resize $id scsi0 +15G
    wait
    qm set $id --onboot=1
    wait
    qm start $id
    wait
    echo "VM is ready!"
    ((j++))
done