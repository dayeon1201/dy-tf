variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidrs" {
  description = "Public Subnet IDs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private Subnet IDs"
  type        = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "resource_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "owner" {
  type = string
}