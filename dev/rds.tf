resource "aws_db_instance" "project_rds" {

    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    allocated_storage = 20
    db_subnet_group_name = aws_db_subnet_group.project_db_private_subnet.name
    db_name = "mydb"
    username = "admin"
    password = "securepass"
    publicly_accessible = false
    vpc_security_group_ids = [aws_security_group.project_sg.id]
    skip_final_snapshot = true    

    tags = {
        Name = "project-rds"
  }
}