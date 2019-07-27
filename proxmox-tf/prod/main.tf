provider "proxmox" {
  pm_tls_insecure = true
}

module "k3s-cluster" {
  source = "../modules/generic-cluster"

  name_prefix = "k3s-node"
  ips = [
    "172.30.100.80",
    "172.30.100.81",
    "172.30.100.82",
    "172.30.100.83",
  ]

  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDISjep4jUbOva1XvUrMoyTJ2XLnroypaOq/my06B7idX0Y3YD51uyJmCj51g62805k8HzW65Mo1jTPfM5ezeZE7qhqMA1OJyOg1dCTiyrzgLG/BV/M42eumz9Q3bO+1BXVVO6Ai/K3fnU/g7y48mfx/1rc3IDeiD6G+Dwm7zaEYESq62rrHV44uaat3Hb3sQ22IgjQ7wqcpxT28hVSqL7PWzf8nnYGg2fJgqiky52QwLPMoGItNKnFlzp7ucIGo5qJjh1TCMlRTIzmpYgFUsf4d3gHLKpFDCuoF+F2JLLTMx8AC1ti5rrmf5oslidQtIdPfRQdC7D8dBJkeoq0UdCZ peyton@jump
EOF

  gateway = "172.30.100.1"
  bridge = "vmbr100"
  storage_size = "32G"
  storage_pool = "hermes_data"
  target_node = "hermes"
}
