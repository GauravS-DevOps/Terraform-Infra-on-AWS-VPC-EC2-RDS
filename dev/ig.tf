resource "aws_internet_gateway" "publicgateway" {
    vpc_id = aws_vpc.project_vpc.id
    tags = {
        Name = "publicgateway"
    }
}

