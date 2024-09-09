#IAC for creating a s3 bucket in AWS Provider

resource "aws_s3_bucket" "s3_bucket_web_host" {
 
# calling the bucket name via variable
   bucket = "${var.bucket_name}-${random_id.bucket_id.hex}"

 # tags = {
  #  Name        = "My bucket"
   # Environment = "Dev"
  #}
}


# creating a random id inorder to make the bucket name unique

resource "random_id" "bucket_id"{

   # mentioning the byte length
    byte_length=8

}
