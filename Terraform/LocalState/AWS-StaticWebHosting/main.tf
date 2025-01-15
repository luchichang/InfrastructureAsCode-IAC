#IAC for creating a s3 bucket in AWS Provider

resource "aws_s3_bucket" "s3_bucket_web_host" {
 
# calling the bucket name via variable
   bucket = "${var.bucket_name}-${random_id.bucket_id.hex}"

 # tags = {
  #  Name        = "My bucket"
   # Environment = "Dev"
  #}
}


#setting the bucket ownership
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.s3_bucket_web_host.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# setting the public access 
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3_bucket_web_host.id

  block_public_acls       = false 
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


#creating the s3 acl into public

resource "aws_s3_bucket_acl" "example" {
 
# this resource will start to build only after the dependent resource finished building
   depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.s3_bucket_web_host.id
  acl    = "public-read"
}


# enabling static website hosting for bucket


resource "aws_s3_bucket_website_configuration" "example" {

  depends_on = [
    aws_s3_bucket_acl.example
  ]

  bucket = aws_s3_bucket.s3_bucket_web_host.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

 # routing_rule {
  #  condition {
   #   key_prefix_equals = "docs/"
   # }
   # redirect {
    #  replace_key_prefix_with = "documents/"
    #}
  #}
}


#uploading the index.html file as an object to bucket

resource "aws_s3_object" "index" {

  bucket = aws_s3_bucket.s3_bucket_web_host.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"

}

#uploading error.html file as an object to the bucket

resource "aws_s3_object" "error"{

   bucket = aws_s3_bucket.s3_bucket_web_host.id
   key = "error.html"
   source = "error.html"
   acl = "public-read"
   content_type = "text/html"
}


# creating a random id inorder to make the bucket name unique

resource "random_id" "bucket_id"{

   # mentioning the byte length
    byte_length=8

}
