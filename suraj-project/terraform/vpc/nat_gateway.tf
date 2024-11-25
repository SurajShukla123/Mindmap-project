resource "aws_eip" "nat" {
  count = 1
  tags = {
    Name = "${var.cluster_name}-nat-eip-${count.index}"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.cluster_name}-nat-gateway"
  }
}
