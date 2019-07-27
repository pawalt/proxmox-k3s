provider "proxmox" {
  pm_tls_insecure = true
}

module "k3s-cluster" {
  source = "../modules/generic-cluster"

  name_prefix = "k3s-node"
  ips = [
    "172.30.100.70",
    "172.30.100.71",
    "172.30.100.72",
    "172.30.100.73",
  ]

  sshkeys = <<EOF
ssh-rsa iamansshkey peyton@example.com
EOF

  gateway = ""
  bridge = ""
  storage_size = "32G"
  storage_pool = ""
  target_node = ""
}
