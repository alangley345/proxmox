#reference page: https://www.clickfabric.com/deploying-a-highly-available-rke-cluster-on-proxmox/

qm create 9000 --name focal-cloud --memory 4096 --sockets 1 --cores 2 --net0 virtio,bridge=vmbr1,tag=1010
qm set 9000 --agent enabled=1

wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
qm importdisk 9000 focal-server-cloudimg-amd64.img local
rm focal-server-cloudimg-amd64.img
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local:vm-9000-disk-0
qm set 9000 --boot c --bootdisk scsi0
qm set 9000 --ide2 local:cloudinit