output "ecr_repository_url" {
  value       = aws_ecr_repository.app_repository.repository_url
  description = "URL of the created ECR repository"
}
