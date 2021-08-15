terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.14.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}


resource "random_password" "linode_root_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "linode_instance" "filecoin_node" {
  image           = "linode/ubuntu18.04"
  label           = "filecoin-node"
  group           = "terraform"
  region          = "eu-central"
  type            = "g6-standard-4"
  authorized_keys = [chomp(file(var.ssh_public_key_file))]
  root_pass       = random_password.linode_root_password.result
}

resource "linode_instance" "monitoring" {
  image           = "linode/ubuntu18.04"
  label           = "monitoring"
  group           = "terraform"
  region          = "eu-central"
  type            = "g6-standard-4"
  authorized_keys = [chomp(file(var.ssh_public_key_file))]
  root_pass       = random_password.linode_root_password.result
}