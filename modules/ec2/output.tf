#public ip of my ec2
output "my-ec2-publicIP" {
  # to create multiple instnces add [*] 
    value = aws_instance.example[*].public_ip
  
}

# ec2 machine instance id

output "my-ec2ID" {
  value = aws_instance.example[*].id
}

#store data in local system
resource "local_file" "ipdata" {
  # to create multiple instances
  content  = join("\n",aws_instance.example[*].public_ip)
  # content  = aws_instance.example.public_ip    # for creating single instance
  filename = "${path.module}/ansible-inventory.txt"           # "${path.module} means where we are writing terraform.tf file

  #making manual dependency --changes made in dryrun branch only
  depends_on = [ aws_instance.example ]


}