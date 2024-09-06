output "pip" {
  value = aws_lightsail_instance.ec2-user.public_ip_address
}

output "ssh-command" {
  value = "ssh -i ${local_file.ssh_key.filename} ${aws_lightsail_instance.ec2-user.name}@${aws_lightsail_instance.ec2-user.public_ip_address}"
}
output "username" {
  value = aws_lightsail_instance.ec2-user.username
}