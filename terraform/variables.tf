variable "ssh_public_key_file" {
  type        = string
  description = "Path to SSH public key"
}

variable "linode_region" {
  type        = string
  description = "ID of Linode region"
}

variable "linode_token" {
  type        = string
  description = "Your Linode Personal Access Token"
}
