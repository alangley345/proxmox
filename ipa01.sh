domain=".greatcatlab.net"
id="`pvesh get /cluster/nextid`"

qm clone 9001 $id --full --name ipa01$domain
wait

qm set $id --ipconfig0 ip=10.1.0.10/24,gw=10.1.0.1,ip6=2001:470:e107:1010::10/64,gw6=2001:470:e107:1010::1
wait

qm resize $id scsi0 16G
wait

qm set $id --onboot=1
wait
