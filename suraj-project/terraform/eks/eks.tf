resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  version = "1.27"
  tags = {
    Name        = "${var.environment}-eks-cluster"
    Environment = var.environment
  }
}

resource "aws_launch_template" "eks_worker_nodes" {
  name_prefix = "${var.cluster_name}-worker-"
  key_name    = var.key_name

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 20
      volume_type = "gp3"
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.cluster_name}-worker"
      Environment = var.environment
    }
  }
}

resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "default-node-group"
  node_role_arn   = aws_iam_role.eks_worker_nodes_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }

  launch_template {
    id      = aws_launch_template.eks_worker_nodes.id
    version = "$Latest"
  }

  labels = {
    environment = var.environment
  }

  depends_on = [
    aws_eks_cluster.main
  ]
}
