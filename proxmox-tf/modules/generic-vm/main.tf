resource "proxmox_vm_qemu" "generic-vm" {
  count = length(var.ips)

  name = "${var.node_name}"
  desc = "generic terraform-created vm"
  target_node = "hermes"

  clone = "ubuntu-ci"

  cores = 2
  sockets = 1
  memory = 2048

	disk {
		id = 0
		type = "scsi"
		storage = "hermes_data"
		size = "32G"
	}

  network {
    id = 0
    model = "virtio"
    bridge = "vmbr100"
  }

  ssh_user = "ubuntu"

  os_type = "cloud-init"
  ipconfig0 = "ip=${var.main_ip}/24,gw=172.30.100.1"

  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDISjep4jUbOva1XvUrMoyTJ2XLnroypaOq/my06B7idX0Y3YD51uyJmCj51g62805k8HzW65Mo1jTPfM5ezeZE7qhqMA1OJyOg1dCTiyrzgLG/BV/M42eumz9Q3bO+1BXVVO6Ai/K3fnU/g7y48mfx/1rc3IDeiD6G+Dwm7zaEYESq62rrHV44uaat3Hb3sQ22IgjQ7wqcpxT28hVSqL7PWzf8nnYGg2fJgqiky52QwLPMoGItNKnFlzp7ucIGo5qJjh1TCMlRTIzmpYgFUsf4d3gHLKpFDCuoF+F2JLLTMx8AC1ti5rrmf5oslidQtIdPfRQdC7D8dBJkeoq0UdCZ peyton@jump
EOF
}
