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

module "networking" {

    source = "./networking"
    vpc_cidr = var.vpc_cidr
    # vpc_name = var.vpc_name
    public_subnets = var.public_subnets
    ap_availability_zone = var.ap_availability_zone
    private_subnets = var.private_subnets
  
}

module "Security-group" {

    source = "./security-groups"
    ec2_sg_name = var.ec2_sg_name
    ec2_jenkins_sg_name = var.ec2_jenkins_sg_name
    vpc_id = module.networking.dev_proj_1_vpcid_1

}


module "Jenkins" {

    source = "./jenkins"
    ami_id = var.ami_id
    instance_type = var.instance_type
    tag_name = var.tag_name
    subnet_id = tolist(module.networking.dev_proj_1_public_subnets)[0]
    sg_for_jenkins = [module.sg_ec2_sg_ssh_http_id,module.sg_ec2_jenkins_port_8080]
    enable_public_ip_address = true
    pubpublic_key = var.public_key
    ususer_data_install_jenkins = templatefile("./userdata-jenkins/jenkins-install.sh", {})

}







