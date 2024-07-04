## for ec2

variable "key_name" {
  description = "Name of the key pair"
  default     = "dy-key"
}

variable "public_key_path" {
  description = "Path to the public key"
  default     = "/Users/yangdayeon/.ssh/id_ed25519.pub"
}

variable "ami_id" {
  default = "ami-06c68f701d8090592"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

# variable "subnet_id" {
#     type    = list(string)
# }

# variable "security_groups_id" {
#     type = string
# }

