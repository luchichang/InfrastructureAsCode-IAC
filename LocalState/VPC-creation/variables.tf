variable "cidr_block_value" {
    description = "CIDR value for vpc to assigning ipaddress"
    type = string
    default="172.28.0.0/24"
}

# Subnet CIDR Value
variable "subnet1_cidr_value" {
    description="cidr value for subnet1 "
    type = string
    default = "172.28.0.128/26"
  
}

# Subnet 2 CIDR Value
variable "subnet2_cidr_value" {
    description="cidr value for subnet2 "
    type = string
    default = "172.28.0.192/26"
  
}





# variable for key pair name
variable "key_name" {
    description = " key pair name to remotely access the ec2 instance"
    type = string
    default = "KeyPair19jun"
}




# TODO:  need to find a way to preserve hardcoding the secret

variable "ec2_user_data"{
    description= "script to install and run the ec2 container"
    type = string
    default = <<-EOF
               #!/bin/bash
               apt update -y  &&   apt install docker.io -y
               # append your password
               echo "gfdfg*" | docker login --username "dinesht0006" --password-stdin 
               usermod -aG docker ubuntu
               docker run -itd -p 80:3000 dinesht0006/basic-todo-nodejs-app    
               EOF
}
