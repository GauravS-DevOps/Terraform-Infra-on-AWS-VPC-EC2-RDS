terraform {
  backend "s3" {
    bucket = "gaon-ka-terraform-state"
    key    = "infra/dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
