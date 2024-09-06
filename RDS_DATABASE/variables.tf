
variable "allocated_storage" {
    default = 20
  
}
variable "engine" {
  
  default = "postgres"
}

variable "engine_version" {
  
  default = "13.3"
}
variable "instance_class" {
    default = "db.t3.micro"
  
}
variable "name" {
    default = "mydatabase"
  
}
variable "username" {
    sensitive = true

}
variable "password" {
    sensitive = true
  
}
variable "parameter_group_name" {
  default = "default.postgres13"
   
}
variable "db_subnet_group_name" {
  default = "aws_db_subnet_group.main.name"
  
}
variable "vpc_security_group_ids" {
  default = "aws_security_group.rds_sg.id"
  
}
variable "skip_final_snapshot" {
  default = true
  
}
variable "region" {
  default = "us-east-1"
}