terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "environment/terraform.tfstate"
    region         = "your-region" # e.g., us-west-2
    encrypt        = true
    dynamodb_table = "your-lock-table"
  }
}
