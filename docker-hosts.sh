#!/usr/bin/bash

domain="int.greatcatlab.net"
template="9001"
gw6="2001:470:e107:1010::1"
netAdd="2001:470:e107:1010"
numHosts=3
hostPrefix="docker"
googleDNS1="2001:4860:4860::8888"
googleDNS2="2001:4860:4860::8844"
ciuser="docker"
sshkey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6LgLkaa+B2Pss6CXKJpVx7vp3XJgVEKHdZ/vZzGSSU6um8mq0YRtdymAHnOW46rNzpkBTSeM4f0h+tdWen9pyN6M/oY5Glls/qM/JFEz3yH1m1VoHt5S1d5Uk1vTC8GHDHBr6dj7Mq3Vsr2mjuTtg38HxG6c8uKFV7L2wUiI0qmsfhIpcStbqnX4PhDDvOV7eDQEoGKzolB6mRgV/Pda35phsM0n+NCE/emmUbG1o47bUZ9GLf5V1EiJmAM5HVEflaOL5xctB+CmjRfW75vAdq2YqFsDG2m4PrQFocNcu8lx/q6om6hK6ULYJ5Ci0zIXY83gaBP2tn9obOtUlYOf825EWeF+ZHT0g5LDNxyBa/8JJNcd0gIlwSWkcPA5fLvfwPlXOxw50KGL9Nzs/n8woWV1ll3fD3UuSqUS+6tYyHsqbvZg1+djRoGIAqJtHD/JetwOJP52m1SaODWbXBxLhLClxLyOLjJjLnOFuQdx/wo9eTarpa7Mp6TekeNS2f3c= ansible"

#########################################
j=1
while [ $j -le $numHosts ];
do
    id="`pvesh get /cluster/nextid`"

    qm clone $template $id --full --name $hostPrefix$j.$domain
    wait 
    qm set $id --ipconfig0 ip6=$netAdd:$id::/64,gw6=$gw6 --nameserver $googleDNS1,$googleDNS2 --searchdomain $domain --ciuser $ciuser --sshkey $sshkey
    wait
    qm resize $id scsi0 20G
    wait
    qm set $id --onboot=1
    wait
    echo "VM is ready!"
    ((j++))
done