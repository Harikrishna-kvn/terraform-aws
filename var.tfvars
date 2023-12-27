region = "ap-south-1"
vpc_cidr ="10.0.0.0/16"
#vpc_name = "dev_project_1_vpc"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
ap_availability_zone = ["ap-south-1a", "ap-south-1b"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

ec2_sg_name = "ec2-sg"
ec2_jenkins_sg_name = "jenkins-sg"
#vpc_id = module.aws_vpc.dev_proj_1_ap_south_1.id

#jenkins-servers

ami_id = "ami-03f4878755434977f"
instance_type = "t2.micro"
tag_name = "Jenkins:Ubuntu Linux EC2"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDDoN5ibtYE4ckNpe8bpDZ7h0NavjTw0DLrAZddcMn0I60tW51uldRPZwuVWAw1PL5bEkpFst7yhNE/6QM+g+VgQfCbXF4XH812NqpDPT4IRRzrJi6NG84CetnE+cQBhyLq2hihYQCgSQ168S1t23UBGGm4tijA7gsd1qYFncaAMaysXWzSZlyv1+J2gaxINvO/TJZEMz1JEN+TwFZWbjNjpo5A4VYzX1Zv6HYZCmVqczmdOwTUSU8K+6joH/rijZ/iBaYRmZ2SJ7gSo6ItoDpzlogPRDR9L9CFreyodDyOAdT16p3U/vgvTlJQOejQnVRj6IppkZyzFWAr293KgTh codespace@codespaces-17b912"



