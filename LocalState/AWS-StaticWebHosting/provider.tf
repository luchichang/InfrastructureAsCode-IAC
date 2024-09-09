terraform{
  
  required_providers{
   
    aws ={
      
      source = "hashicorp/aws"
      version = "~>5.0"

    }
  }

}

# configuring the region

provider "aws" {
  
  region = "ap-south-1"

}
