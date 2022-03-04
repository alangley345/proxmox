domain="int.greatcatlab.net"
template="9001"

qm clone $template 201 --full --name docker01$domain
wait

qm clone $template 202 --full --name docker02$domain
wait

qm clone $template 203 --full --name docker03$domain
wait

qm set 201 --ipconfig0 ip6=2001:470:e107:1010::100/64,gw6=2001:470:e107:1010::1
wait

qm set 202 --ipconfig0 ip6=2001:470:e107:1010::101/64,gw6=2001:470:e107:1010::1
wait

qm set 203 --ipconfig0 ip6=2001:470:e107:1010::102/64,gw6=2001:470:e107:1010::1
wait

for i in {201..203}; do qm resize $i scsi0 16G; done

for i in {201..203}; do qm set $i --onboot=1; done