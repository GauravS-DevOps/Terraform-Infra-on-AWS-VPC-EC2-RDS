resource "aws_db_subnet_group" "project_db_private_subnet" {
    name = "project_db_private_subnet"

    subnet_ids = [
        aws_subnet.project_private_subnet.id,
        aws_subnet.project_private_subnet_2.id
    ]
    tags = {
        Name = "project_db_private_subnet"
    }

}