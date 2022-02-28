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

resource "aws_instance" "my-first-server" {
  ami = "ami-0e472ba40eb589f49"

  instance_type = "t2.micro"

  tags = {
    Name = "Ubuntu"
  }
}