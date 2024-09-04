terraform{
  #for installing the provider during terraform init
  required_providers{
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.16"
    }
  }

  #terraform version
  required_version = "~>1.9.0"
}

#provider specific information
provider "aws" {
  #all the Infra are created in this region only
  region = "ap-south-1"
  # can also specify the access key and secret key here raather then assigining Environment variable
 
}


data "aws_ami" "ubuntu"{
  #search in most recent 
  most_recent = true

   filter{
     name  = "name"
#searches for AMI Name
     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
   }


#searches for virtualization type
  filter{
    
    name  = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical owner ID of Ubuntu, described so that only ubuntu's official image are searched

}


#instance resource creation
resource "aws_instance" "app_server"{
  
   ami           = data.aws_ami.ubuntu.id
   instance_type = "t2.micro"

   tags = {

#app server    
     Name = "app-server"
   }
  
}

