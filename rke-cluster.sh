domain=".greatcatlab.net"

qm clone 900 200 --full --name rancher01$domain
qm clone 900 201 --full --name rke1$domain
qm clone 900 202 --full --name rke2$domain
qm clone 900 203 --full --name rke3$domain

qm set 200 --ipconfig0 ip=10.1.0.50/24,gw=10.1.0.1,ip6=2001:470:e107:1010::50/64,gw6=2001:470:e107:1010::1
qm set 201 --ipconfig0 ip=10.1.0.100/24,gw=10.1.0.1,ip6=2001:470:e107:1010::100/64,gw6=2001:470:e107:1010::100
qm set 202 --ipconfig0 ip=10.1.0.101/24,gw=10.1.0.1,ip6=2001:470:e107:1010::101/64,gw6=2001:470:e107:1010::101
qm set 203 --ipconfig0 ip=10.1.0.102/24,gw=10.1.0.1,ip6=2001:470:e107:1010::102/64,gw6=2001:470:e107:1010::102

for i in {200..203}; do qm resize $i scsi0 16G; done
for i in {200..203}; do qm set $i --onboot=1; done
