output "vpc_id" {
  description = "The ID of the VPC"
  value       = data.aws_vpc.existing_vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR of the VPC"
  value       = data.aws_vpc.existing_vpc.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the Public Subnets"
  value       = data.aws_subnets.existing_public_subnet.ids
}
output "private_ec2_subnet" {
  value = { for key, subnet in data.aws_subnet.private_ec2_subnet : key => subnet.cidr_block }
}

# output "private_ec2_subnet_ids" {
#   value = { for key, subnet in data.aws_subnets.existing_private_ec2_subnet.ids : key => subnet }
# }
output "private_db_subnet" {
  value = { for key, subnet in data.aws_subnet.private_db_subnet : key => subnet.cidr_block }
}

output "private_ec2_subnet_ids" {
  description = "IDs of the private EC2 subnets"
  value       = data.aws_subnets.existing_private_ec2_subnet.ids
}

output "private_db_subnet_ids" {
  description = "IDs of the private DB subnets"
  value       = data.aws_subnets.existing_private_db_subnet.ids
}


