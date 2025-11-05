#public ip of my ec2
output "my-ec2-publicIP" {
    value = aws_instance.example.public_ip
  
}

# ec2 machine instance id

output "my-ec2ID" {
  value = aws_instance.example.id
}

#store data in local system
resource "local_file" "ipdata" {
  content  = aws_instance.example.public_ip
  filename = "${path.module}/myip.txt"

  #making manual dependency --changes made in dryrun branch only
  depends_on = [ aws_instance.example ]


}