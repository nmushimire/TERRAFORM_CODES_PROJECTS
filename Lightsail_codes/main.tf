resource "aws_lightsail_instance" "test_server" {
  name              = var.server_name
  availability_zone = var.az
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
}