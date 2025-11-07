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

#calling modules 
    module "my-viresh-module-ec2" {
    source = "./modules/ec2"
    viresh-ami-id = "ami-0a25a306450a2cba3"
    vm-name = "viresh-vm-by-module-day4"    #"viresh-vm-by-module"
    vm-size = "t2.nano"
    ec2-key-name = "viresh-key-bymoduleday4"
    private-key-algo = "RSA"
    key-size = 4096
    my-vpc-id = "vpc-02d56e9aa1ce2f114"  
    my-sec-group-name = "viresh-bymode-sec"
    novm = 2

    }

