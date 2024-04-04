# Define the existing VPC data source
data "aws_vpc" "existing_vpc" {
  id = "vpc-0bb1d2b66560ffcf4"
}

# Retrieve existing subnets in the VPC
data "aws_subnets" "existing_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
}

# # Retrieve details of existing subnets
# data "aws_subnet" "existing_subnet_ids" {
#   for_each = toset(data.aws_subnets.existing_subnet.ids)
#   id       = each.value
# }

# Get source ID Public Subnet
data "aws_subnets" "existing_public_subnet" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
  
  filter {
    name   = "tag:Name"
    values = ["Public Subnet A", "Public Subnet B", "Public Subnet C"] # Add all the Name tag values here
  }
}

data "aws_subnet" "public_subnet" {
  for_each = toset(data.aws_subnets.existing_public_subnet.ids)
  id       = each.value
}


# Get source ID Private APP Subnet
data "aws_subnets" "existing_private_ec2_subnet" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
  
  filter {
    name   = "tag:Name"
    values = ["Private Subnet App A", "Private Subnet App B", "Private Subnet App C"] # Add all the Name tag values here
  }
}

data "aws_subnet" "private_ec2_subnet" {
  for_each = toset(data.aws_subnets.existing_private_ec2_subnet.ids)
  id       = each.value
}

# Get source ID Private DB Subnet
data "aws_subnets" "existing_private_db_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
  
  filter {
    name   = "tag:Name"
    values = ["Private Subnet DB A", "Private Subnet DB B", "Private Subnet DB C"] # Add all the Name tag values here
  }
}

data "aws_subnet" "private_db_subnet" {
  for_each = toset(data.aws_subnets.existing_private_db_subnet.ids)
  id       = each.value
}

