
# fetches the ubunutu free tire AMI id

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
