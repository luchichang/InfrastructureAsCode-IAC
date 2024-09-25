# creates the VPC with cidr value 
resource "aws_vpc" "todo_vpc" {
  cidr_block       = var.cidr_block_value
  instance_tenancy = "default"

  tags = {
    Name = "todo_vpc"
  }
}

# Creates the Internet gateway
resource "aws_internet_gateway" "todo_vpc_igw" {
  #vpc_id = aws_vpc.todo_vpc.id

  tags = {
    Name = "todo_vpc_igw"
  }
  # depends_on=[aws_vpc.todo_vpc]
}

# attach the vpc to the igw 
resource "aws_internet_gateway_attachment" "example" {
  internet_gateway_id = aws_internet_gateway.todo_vpc_igw.id
  vpc_id              = aws_vpc.todo_vpc.id

   depends_on = [aws_internet_gateway.todo_vpc_igw,
     aws_vpc.todo_vpc
   ]
}


#creating the route table 
resource "aws_route_table" "todo_routetable" {
  vpc_id = aws_vpc.todo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.todo_vpc_igw.id
  }

#local routes only imported or adopted but not created
  #route {
   # cidr_block        = "::/0"
   # gateway_id="local" 
  #}

  tags = {
    Name = "todo_routetable"
  }
}

# creating the subnet 1
resource "aws_subnet" "todo_subnet_1" {
  vpc_id     = aws_vpc.todo_vpc.id
  cidr_block = var.subnet1_cidr_value
  availability_zone = "ap-south-1a"

  tags = {
    Name = "todo_subnet_1"
  }
}
# creating the subnet 2
resource "aws_subnet" "todo_subnet_2" {
  vpc_id     = aws_vpc.todo_vpc.id
  cidr_block = var.subnet2_cidr_value
  availability_zone = "ap-south-1b"
  tags = {
    Name = "todo_subnet_2"
  }
}

#attaching the subnet to the route table 
resource "aws_route_table_association" "todo_association" {
  subnet_id      = aws_subnet.todo_subnet_1.id
  #subnet_id = aws_subnet.todo_subnet_2.id
  route_table_id = aws_route_table.todo_routetable.id
}

resource "aws_route_table_association" "todo_association2" {
  #subnet_id      = aws_subnet.todo_subnet_1.id
  subnet_id = aws_subnet.todo_subnet_2.id
  route_table_id = aws_route_table.todo_routetable.id
}


#creating the security group
resource "aws_security_group" "todo_app_sg" {
    name = "todo_app_sg"
    description = "security group for the application"

    vpc_id = aws_vpc.todo_vpc.id

# have to change the all port 
    #ingress rule
    ingress {
        from_port = 0 
        to_port = 65535
        protocol = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 80
      to_port = 80 
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks= ["0.0.0.0/0"]
    }

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "app_sg" 
    }
}

#creating the ec2 instance resource 
resource "aws_instance" "bastion"{
  
   ami           = data.aws_ami.ubuntu.id
   instance_type = "t2.micro"
   subnet_id     = aws_subnet.todo_subnet_1.id
   key_name      = var.key_name
   associate_public_ip_address = true  # Assigns a public IP
   user_data = var.ec2_user_data
   # Attach the security group here
   vpc_security_group_ids = [aws_security_group.todo_app_sg.id]



   tags = {

#app server    
     Name = "bastion"
   }
  
}


