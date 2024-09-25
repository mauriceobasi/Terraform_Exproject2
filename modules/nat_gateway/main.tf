resource "aws_eip" "nat" {
  # Allocate an Elastic IP address for the NAT Gateway
}

resource "aws_nat_gateway" "this" {
  # Create the NAT Gateway using the Elastic IP
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name        = "NATGateway"
    Environment = var.environment
  }
}

resource "aws_route_table" "private" {
  # Create a route table for the private subnet
  vpc_id = var.vpc_id

  route {
    # Route traffic from private subnets to the NAT Gateway
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name        = "PrivateRouteTable"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "private" {
  # Associate the route table with the private subnet
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}

# Optional: Output the NAT Gateway ID and Elastic IP
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_eip" {
  description = "The Elastic IP associated with the NAT Gateway"
  value       = aws_eip.nat.public_ip
}
