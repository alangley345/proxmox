import config
from proxmoxer import ProxmoxAPI

proxmox = ProxmoxAPI(config.proxmoxHost, user=config.user, token_name=config.tokenName, token_value=config.tokenValue)

node = proxmox.nodes.proxmox_node()
print(node.storage.local.content.get())