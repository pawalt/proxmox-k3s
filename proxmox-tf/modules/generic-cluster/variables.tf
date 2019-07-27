variable "ips" {
  description = "List of IPs for cluster nodes"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix for node names"
  type = string
}

variable "cores" {
  description = "number of cores to give each vm"
  type = number
  default = 2
}

variable "memory" {
  description = "amount of memory in MB give each vm"
  type = number
  default = 2048
}

variable "sshkeys" {
  description = "ssh keys to drop onto each vm"
  type = string
}

variable "ssh_user" {
  description = "user to put ssh keys under"
  type = string
  default = "ubuntu"
}

variable "gateway" {
  description = "gateway for cluster"
  type = string
}

variable "bridge" {
  description = "bridge to use for network"
  type = string
  default = "vmbr0"
}

variable "storage_size" {
  description = "amount of storage to give nodes"
  type = string
  default = "8G"
}

variable "storage_pool" {
  description = "storage pool to use for disk"
  type = string
  default = "local"
}

variable "target_node" {
  description = "node to deploy on"
  type = string
}

variable "template_name" {
  description = "template to use"
  type = string
  default = "ubuntu-ci"
}
