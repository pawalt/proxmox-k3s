resource "proxmox_vm_qemu" "generic-vm" {
  count = length(var.ips)

  name = "${var.name_prefix}-${count.index}"
  desc = "generic terraform-created vm"
  target_node = var.target_node

  clone = "ubuntu-ci"

  cores = var.cores
  sockets = 1
  memory = var.memory

  disk {
    id = 0
    type = "scsi"
    storage = var.storage_pool
    size = var.storage_size
  }

  network {
    id = 0
    model = "virtio"
    bridge = var.bridge
  }

  ssh_user = var.ssh_user

  os_type = "cloud-init"
  ipconfig0 = "ip=${var.ips[count.index]}/24,gw=${var.gateway}"

  sshkeys = var.sshkeys
}

