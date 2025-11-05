# creating ec2 vm 
resource "aws_instance" "example" {
  #ami           = "ami-0a25a306450a2cba3"
  ami = var.viresh-ami-id # variable id came from variables.tf. the value will be asked during run time. 
  instance_type = var.vm-size    # "t2.nano"
  key_name      = aws_key_pair.example.key_name
                    #var.ec2-key-name      #"roche-key"
  # changing tags_all to tags 
  tags = {
    "Name" = var.vm-name     #"viresh-vm-1"
  }

}