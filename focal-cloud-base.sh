qm create 9000 --name focal-cloud --memory 4096 --sockets 1 --cores 2 --net0 virtio,bridge=vmbr0,vlan=1010
qm set 9000 --agent enabled=1