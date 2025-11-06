# creating ec2 vm 
resource "aws_instance" "example" {
  #ami           = "ami-0a25a306450a2cba3"
  ami = var.viresh-ami-id # variable id came from variables.tf. the value will be asked during run time. 
  instance_type = var.vm-size    # "t2.nano"
  key_name      = aws_key_pair.example.key_name
                    #var.ec2-key-name      #"roche-key"
  #security_groups = [ aws_security_group.allow_tls.name ]
  vpc_security_group_ids = [ aws_security_group.allow_tls.id]

  # changing tags_all to tags 
  tags = {
    "Name" = var.vm-name     #"viresh-vm-1"
  }
#provisioner
provisioner "remote-exec" {
  inline = [ 
    "sudo dnf install git httpd -y",
    "mkdir -p hello/terraform"
   ]
}

connection {  
  type = "ssh"
  user = "ec2-user"
  host = self.public_ip
  timeout = "3m"

  #content of private key data
  private_key = tls_private_key.rsa-4096-example.private_key_pem
}


} 

