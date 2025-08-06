resource "aws_subnet" "project_private_subnet_2" {
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "project_private_subnet_2"
  }
}
