output "eks_cluster_id" {
  value = aws_eks_cluster.main.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_role.arn
}
