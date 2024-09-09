# AWS Provider Authentication & Authorization 
 
## Description,
        ways to provide Authentication and Authorization for creating, managing, configuring, and deleting AWS Resources.


## Type 1: *Parameter in the Provider Configuration*

   * configure the Access & Secret Access key in the Provider block in terraform
     
          provider "aws" {
            region     = "ap-south-1" #desired Region
            access_key = "your-access-key" 
            secret_key = "your-secret-key"
          }

## Type 2: *Environment Varaibles*

   * Can also be provided in the environment variables

          % export AWS_ACCESS_KEY_ID="anaccesskey"
          % export AWS_SECRET_ACCESS_KEY="asecretkey"
          % export AWS_REGION="us-west-2"
          % terraform plan

## Type 3: *Assuming IAM Role*
  
   * creating an IAM Role in AWS and configuring in ** Assume role ** in provider section

         provider "aws" {
           assume_role {
             role_arn     = "arn:aws:iam::123456789012:role/ROLE_NAME"
             session_name = "SESSION_NAME"
             external_id  = "EXTERNAL_ID"
           }
         }

## Type 4: *Shared Configuration and Credentials file*

   * storing the configuration and credentials file in the $HOME/.aws/config and $HOME/.aws/credentials  file path and mentioning it in the Provider Section.

         provider "aws" {
            shared_config_files      = ["/Users/tf_user/.aws/conf"] #your file location
            shared_credentials_files = ["/Users/tf_user/.aws/creds"]
            profile                  = "customprofile"
         } 
