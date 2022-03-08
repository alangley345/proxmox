#reference page: https://www.clickfabric.com/deploying-a-highly-available-rke-cluster-on-proxmox/

id="9001"
name="fedora-35"
url="https://download.fedoraproject.org/pub/fedora/linux/releases/35/Cloud/x86_64/images/Fedora-Cloud-Base-35-1.2.x86_64.qcow2"

qm create $id --name $name --memory 4096 --sockets 1 --cores 2 --net0 virtio,bridge=vmbr1,tag=1010
wait
qm set $id --agent enabled=1
wait

wget $url
wait
qm importdisk $id Fedora-Cloud-Base-35-1.2.x86_64.qcow2 local
wait
rm Fedora-Cloud-Base-35-1.2.x86_64.qcow2
wait
qm set $id --scsihw virtio-scsi-pci --scsi0 local:$id/vm-$id-disk-0.raw
wait
qm set $id --boot c --bootdisk scsi0
wait
qm set $id --ide2 local:cloudinit
wait
qm template $id
wait