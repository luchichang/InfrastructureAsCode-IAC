#variable for infrastructure

variable "bucket_name" {

 # type of the variable

   type  = string

# default value, which makes variable value optional

#note: s3 bucket name should be globally unique 
   default = "static-web-host-bucket"

  

}

