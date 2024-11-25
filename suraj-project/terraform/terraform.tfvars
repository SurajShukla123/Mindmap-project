# Provide values for the variables (overrides defaults in variables.tf)
bucket_name          = "my-terraform-state-bucket"
lock_table_name      = "my-lock-table"
aws_region           = "us-west-2"
cluster_name         = "my-eks-cluster"
key_name             = "my-keypair"
security_group_ids   = ["sg-12345678", "sg-87654321"]
environment          = "production"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
