domain=".greatcatlab.net"
gw="10.1.0.1"
gw6="2001:470:e107:1010::1"
id="9000"

qm clone $id 200 --full --name rancher01$domain
wait
qm clone $id 201 --full --name rke1$domain
wait
qm clone $id 202 --full --name rke2$domain
wait
qm clone $id 203 --full --name rke3$domain
wait

qm set 200 --ipconfig0 ip=10.1.0.50/24,gw=$gw,ip6=2001:470:e107:1010::50/64,gw6=$gw6
wait
qm set 201 --ipconfig0 ip=10.1.0.100/24,gw=$gw,ip6=2001:470:e107:1010::100/64,gw6=$gw6
wait
qm set 202 --ipconfig0 ip=10.1.0.101/24,gw=$gw,ip6=2001:470:e107:1010::101/64,gw6=$gw6
wait
qm set 203 --ipconfig0 ip=10.1.0.102/24,gw=$gw,ip6=2001:470:e107:1010::102/64,gw6=$gw6
wait

#change drive size
for i in {200..203}; do qm resize $i scsi0 16G; done
wait

#set them to boot on startup
for i in {200..203}; do qm set $i --onboot=1; done
wait

#start vms
for i in {200..203}; do qm start $i; done
wait

#reboot incase cloud-init updates kernel
for i in {200..203}; do qm reboot $i; done
wait
