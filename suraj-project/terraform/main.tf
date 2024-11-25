module "vpc" {
  source               = "./vpc"
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment          = var.environment
}

module "eks" {
  source             = "./eks"
  cluster_name       = var.cluster_name
  key_name           = var.key_name
  security_group_ids = var.security_group_ids
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnet_ids
  environment        = var.environment
}

module "ecr" {
  source          = "./ecr"
  repository_name = "django-webapp-repository"
  environment     = var.environment
}


