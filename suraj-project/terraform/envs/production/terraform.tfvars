aws_region           = "us-east-1"
environment          = "production"
cluster_name         = "production-cluster"
vpc_cidr             = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]
ecr_repository_name  = "production-django-webapp"
tags = {
  Environment = "production"
  Owner       = "DevOps"
}
