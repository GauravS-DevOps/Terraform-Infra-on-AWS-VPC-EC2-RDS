resource "aws_security_group" "project_sg" {
    name = "project_sg"
    description = "used for ssh and http"
    vpc_id = aws_vpc.project_vpc.id


    ingress {
        description = "SSH"
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "project_sg"
    }

}