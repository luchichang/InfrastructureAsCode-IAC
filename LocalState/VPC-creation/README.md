# VPC (Virtual Private Cloud) Creation

## Description;
   creating the terraform infra code for creating the VPC in the following CIDR Block

* 10.4.0.0/16  (65,536 IPs)
* 172.28.0.0/20 (4,096 IPs)
* 192.168.34.0/24 (256 IPs)

## Steps to create the aws resource
 
 * run __Terraform init__ command to initialize the aws terraformm provider
 * for dry running the infra code type
     terraform plan
 * to create the ec2 instance in the aws provider
     terraform apply 
 or
     terraform apply --auto-approve