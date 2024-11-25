# Setup Guide

## Prerequisites
- AWS CLI installed and configured.
- Terraform installed (>=1.3.0).
- Kubectl installed.

## Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/project.git
   cd project


2. Configure terraform.tfvars:

aws_region       = "us-east-1"
vpc_cidr         = "10.0.0.0/16"
environment      = "staging"


3. Initialize and apply Terraform:

terraform init
terraform apply


4. Verify Kubernetes access:

kubectl get nodes

5. Troubleshooting

If terraform apply fails, check AWS IAM permissions.
Ensure kubectl is pointing to the correct EKS cluster using:

aws eks update-kubeconfig --region us-east-1 --name my-cluster
