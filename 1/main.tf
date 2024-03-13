resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = "pan"
  password             = "pan12345"
  skip_final_snapshot = true // required to destroy
}

