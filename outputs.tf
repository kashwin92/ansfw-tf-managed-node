output "win_admin-pwd" {
  value = module.aws-ec2-win2016.Administrator_Password
}

output "win_public_ip" {
  value = module.aws-ec2-win2016.Public_IP
}