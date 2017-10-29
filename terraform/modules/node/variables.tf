variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable provisioner_connection_key_path {
  description = "Path to the private key used for provisioner's ssh access"
}

variable role {
  description = "Node role (ex. master or slave)"
}

variable name {
  description = "Node name (ex. master, slave1, slave2, ...)"
}