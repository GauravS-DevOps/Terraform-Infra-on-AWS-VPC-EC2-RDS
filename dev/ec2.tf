resource "aws_instance" "terraform_infra" {

    ami = "ami-0e001c9271cf7f3b9"
    key_name = "terraform"
    vpc_security_group_ids = [aws_security_group.project_sg.id]
    instance_type = "t2.medium"
    subnet_id = aws_subnet.project_public_subnet.id
    associate_public_ip_address = true



    tags = {
        Name = "terraform_infra"
    }
}