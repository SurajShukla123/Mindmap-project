resource "aws_iam_policy" "ecr_access_policy" {
  name        = "${var.cluster_name}-ecr-access"
  description = "Policy to allow EKS nodes to pull images from ECR"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["ecr:GetAuthorizationToken", "ecr:BatchCheckLayerAvailability", "ecr:GetDownloadUrlForLayer", "ecr:DescribeRepositories", "ecr:BatchGetImage"],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_ecr_policy" {
  policy_arn = aws_iam_policy.ecr_access_policy.arn
  role       = aws_iam_role.worker_node_role.name
}

resource "aws_iam_role" "eks_worker_nodes_role" {
  name = "eks-worker-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_worker_nodes_role_policy" {
  role       = aws_iam_role.eks_worker_nodes_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_worker_nodes_s3_policy" {
  role       = aws_iam_role.eks_worker_nodes_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "eks_worker_nodes_autoscaling_policy" {
  role       = aws_iam_role.eks_worker_nodes_role.name
  policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
}
