output "vpc_id" {
  value = aws_vpc.dy_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.dy_public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.dy_private_subnet[*].id
}

# output "public_subnet_ids" {
#   value = module.network.public_subnet_ids
# }

# output "private_subnet_ids" {
#   value = module.network.private_subnet_ids
# }

# output "dy_instance_id" {
#   value = module.ec2-resources.dy_instance.id
# }

# output "ec2_instance_public_ips"{
#   value = module.network[*].public_ip
# }