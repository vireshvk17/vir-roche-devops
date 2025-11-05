# creating rsa based 4096 bits key pair 

resource "tls_private_key" "rsa-4096-example" {
   algorithm = var.private-key-algo
  rsa_bits  = var.key-size
}

#same my private key

resource "local_file" "private-key-data" {
  content = tls_private_key.rsa-4096-example.private_key_pem
  filename = "${path.module}/viresh-key.pem"
  file_permission = 0400
}

# sending public key to AWS cloud account 
resource "aws_key_pair" "example" {
  public_key = tls_private_key.rsa-4096-example.public_key_openssh
  key_name = "viresh-private-key"
}