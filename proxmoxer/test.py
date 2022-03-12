from pickle import TRUE
from telnetlib import STATUS
from venv import create
import config
from proxmoxer import ProxmoxAPI

proxmox = ProxmoxAPI(config.proxmoxHost, user=config.user, token_name=config.tokenName, token_value=config.tokenValue)

myNode = proxmox.nodes('proxmox')
vmID = proxmox.cluster.nextid.get()
ip6  = "2001:470:e107:1010:0101:0000:0000:0000/64"
gw6  = "2001:470:e107:1010:0000:0000:0000:0001"
tag  = 1010

net0 =('name=eth0.%s,bridge=vmbr1,ip6=%s,gw6=%s,tag=%s' % (tag,ip6,gw6,tag))
print(net0)

myNode.lxc.create(vmid=vmID,
    ostemplate='local:vztmpl/fedora-35-default_20211111_amd64.tar.xz',
    hostname='fedora-test',
    storage='local',
    memory=512,
    swap=512,
    cores=1,
    password='secret',
    net0=net0,
    unprivileged=1)

#myNode.lxc(vmID).status.start.create()

#{node}/lxc/{vmid}/status/start

