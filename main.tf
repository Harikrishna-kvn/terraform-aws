terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "Networking" {

    source = "./networking"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    public_subnets = var.public_subnets
    ap_availability_zone = var.ap_availability_zone
    private_subnets = var.private_subnets
  
}
