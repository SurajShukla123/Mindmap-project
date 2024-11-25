aws_region           = "us-west-2"
environment          = "staging"
cluster_name         = "staging-cluster"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
ecr_repository_name  = "staging-django-webapp"
tags = {
  Environment = "staging"
  Owner       = "DevOps"
}
