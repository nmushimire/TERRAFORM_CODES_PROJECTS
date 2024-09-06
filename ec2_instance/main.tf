resource "aws_instance" "web" {
  ami           = var.ami_name
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}