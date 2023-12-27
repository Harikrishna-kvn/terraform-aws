variable "region" {}
#network variable
variable "vpc_cidr" {}
#variable "vpc_name" {}
variable "public_subnets" {}
variable "ap_availability_zone" {}
variable "private_subnets" {}

#security variable


variable "ec2_sg_name" {}
variable "ec2_jenkins_sg_name" {}

#jenkins-server variables

variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
/*variable "subnet_id" {}
variable "sg_for_jenkins" {}
variable "enable_public_ip_address" {}
variable "user_data_install_jenkins" {}*/


