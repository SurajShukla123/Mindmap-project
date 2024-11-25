variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "key_name" {
  description = "The key name for the EC2 instances"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to worker nodes"
  type        = list(string)
}
