terraform {

backend "s3" {

    bucket = "viresh-terraform-bucket"
    key    = "dev/viresh/terraform.tfstate"
    dynamodb_table = "viresh-roche-table1"
    region = "ap-southeast-2"
    encrypt = true
      
}


  required_providers {
    
    aws = {
        source = "hashicorp/aws"
        version = "6.19.0"
    }
  }
}


provider "aws" {
 # Configuration options
 # region location info
region = "ap-southeast-2"
}

#creating ec2 VM
resource "aws_instance" "example" {
  ami = "ami-0a25a306450a2cba3"
  instance_type = "t2.nano"
  key_name = "roche-key"
  tags_all = {
    "Name" = "viresh-vm-1"
  }

#}