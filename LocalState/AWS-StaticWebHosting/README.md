# Static Web Hosting in S3 bucket
 
## Description,
           Terraform Infrastructure as Code will create a s3 bucket and host a static website within the s3 bucket

## Pre-requisite,
  
  * AWS Credentials
  * EC2 Instance
  * Terraform Software installed

## Steps,

  * Configure the Provider in this case AWS, and initialize the terraform 

note: AWS provider is underneath a Plugin
       
         terraform init 

  * Dry running the IAC code 

         terraform plan

  * Applying the changes 

*displays the prompt and if typed yes the Infrastructure will be created as per the code*

         terraform apply

*Applies the code without prompting*

         terraform apply -auto-approve

  * Testing the result, once terraform is applied successfully, you can verify it using
   
          aws s3 ls   
