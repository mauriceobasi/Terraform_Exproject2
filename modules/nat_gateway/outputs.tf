output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_eip" {
  description = "The Elastic IP associated with the NAT Gateway"
  value       = aws_eip.nat.public_ip
}

output "private_route_table_id" {
  description = "The ID of the route table associated with the private subnet"
  value       = aws_route_table.private.id
}
