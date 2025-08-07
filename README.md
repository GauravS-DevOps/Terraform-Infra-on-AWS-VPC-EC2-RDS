# 🚀 Terraform Infrastructure on AWS: VPC, EC2, RDS with S3 and DynamoDB

This project sets up a complete AWS infrastructure using Terraform including:
- A custom VPC with public and private subnets
- An Internet Gateway and route tables
- EC2 instance in the public subnet
- RDS MySQL instance in the private subnet
- Remote state backend using S3 and DynamoDB

---

## 🏗️ Project Structure

```
dev/
├── provider.tf
├── s3.tf
├── vpc.tf
├── ig.tf
├── route.tf
├── associate-route.tf
├── sg.tf
├── ec2.tf
├── db-subnet-gp.tf
├── rds.tf
```

---

## 📦 Prerequisites

- AWS CLI configured (`aws configure`)
- IAM permissions to create VPC, EC2, RDS, S3, and DynamoDB
- Terraform installed

---

## ⚙️ Step-by-Step Guide

### 1. 🔐 Remote Backend Setup – `s3.tf`

Create S3 bucket and DynamoDB table manually (or via Terraform in another workspace):
```hcl
terraform {
  backend "s3" {
    bucket         = "project-terraform-state"
    key            = "infra/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
```

> 📌 Ensure that:
> - S3 bucket `project-terraform-state` exists
> - DynamoDB table `terraform-locks` exists with primary key `LockID`

Run:
```bash
terraform init
```

---

### 2. 🌐 VPC and Subnets – `vpc.tf`

```hcl
resource "aws_vpc" "project_vpc" { ... }
resource "aws_subnet" "project_public_subnet" { ... }
resource "aws_subnet" "project_private_subnet" { ... }
resource "aws_subnet" "project_private_subnet_2" { ... }
```

---

### 3. 🌉 Internet Gateway – `ig.tf`

```hcl
resource "aws_internet_gateway" "publicgateway" { ... }
```

---

### 4. 🛣️ Route Table – `route.tf`

```hcl
resource "aws_route_table" "public_route" { ... }
resource "aws_route" "public_route_gateway" { ... }
```

---

### 5. 🧭 Route Table Association – `associate-route.tf`

```hcl
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.project_public_subnet.id
  route_table_id = aws_route_table.public_route.id
}
```

---

### 6. 🔐 Security Groups – `sg.tf`

```hcl
resource "aws_security_group" "project_sg" { ... }
```

---

### 7. 💻 EC2 Instance – `ec2.tf`

```hcl
resource "aws_instance" "terraform_infra" { ... }
```

---

### 8. 🗃️ RDS Subnet Group – `db-subnet-gp.tf`

```hcl
resource "aws_db_subnet_group" "project_db_private_subnet" { ... }
```

---

### 9. 🛢️ RDS MySQL Instance – `rds.tf`

```hcl
resource "aws_db_instance" "project_rds" { ... }
```

> ⚠️ Requires at least two private subnets in **two different AZs**.

---

## 🧪 Usage

```bash
terraform init
terraform plan
terraform apply
```

To apply specific parts:
```bash
terraform apply -target=aws_instance.terraform_infra
terraform apply -target=aws_db_instance.project_rds
```

---

## 📍 Notes

- Tags are applied to identify resources easily.
- Use `terraform destroy` to clean up.

---

## 👤 Author

**Gaurav Singh**