terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


# Resource to create ubuntu instance, uncomment and use terraform apply to create it
# resource "aws_instance" "my-first-server" {
#   ami = "ami-0e472ba40eb589f49"

#   instance_type = "t2.micro"

#   tags = {
#     Name = "Ubuntu"
#   }
# }

# Resource to create a vpc instance, use terraform apply to crete it
resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "production"
  }
}
# Resource to create a subnet instance that references the vpc instance we declared above, use terraform apply to crete it
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}