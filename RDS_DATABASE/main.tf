

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

# Create a security group
resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow PostgreSQL traffic"
  vpc_id      = aws_vpc.main.id

  # Allow inbound PostgreSQL traffic
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to the world (use with caution)
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an RDS instance
resource "aws_db_instance" "postgres" {
  allocated_storage    = var.allocated_storage                   # Storage size in GB
  engine               = var.engine             # Database engine
  engine_version       = var.engine_version               # Version of the database engine
  instance_class       = var.instance_class         # Instance class
  name                 = var.name          # Name of the database
  username             = var.username             # Master username
  password             = var.password        # Master password (use secure storage for sensitive data)
  parameter_group_name = var.parameter_group_name   # Parameter group name
  db_subnet_group_name = var.db_subnet_group_name # Subnet group name
  vpc_security_group_ids =var.vpc_security_group_ids  # Security group IDs
  skip_final_snapshot  = var.skip_final_snapshot                   # Whether to skip final snapshot upon deletion
}
# Create a DB subnet group
resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = [aws_subnet.main.id]

  tags = {
    Name = "Main subnet group"
  }
}

# Output the RDS instance endpoint
output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}