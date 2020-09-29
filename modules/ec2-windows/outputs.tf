output "Administrator_Password" {
   value = rsadecrypt(aws_instance.terraform.password_data,file("${path.module}/kerberos.pem"))
}

output "Public_IP" {
   value = aws_instance.terraform.public_ip
}