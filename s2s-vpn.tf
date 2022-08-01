resource "aws_customer_gateway" "this" {
  bgp_asn    = 65000
  ip_address = "219.65.95.34"
  type       = "ipsec.1"
  tags = {
    "Name" = "${local.environment}-${var.product}-cgw"
  }
}

resource "aws_vpn_gateway_attachment" "this" {
  vpc_id         = module.vpc.vpc_id
  vpn_gateway_id = aws_vpn_gateway.this.id
}

resource "aws_vpn_gateway" "this" {
  vpc_id = module.vpc.vpc_id
}

resource "aws_vpn_connection" "this" {
  vpn_gateway_id      = aws_vpn_gateway.this.id
  customer_gateway_id = aws_customer_gateway.this.id
  type                = "ipsec.1"
  static_routes_only  = true
  local_ipv4_network_cidr = "0.0.0.0/0"
  remote_ipv4_network_cidr = module.vpc.vpc_cidr_block
  tags = {
    "Name" = "${local.environment}-${var.product}-s2s"
  }
}

resource "aws_vpn_gateway_route_propagation" "this" {
  vpn_gateway_id = aws_vpn_gateway.this.id
  route_table_id = module.vpc.private_route_table_ids[0]
}

resource "aws_vpn_gateway_route_propagation" "this1" {
  vpn_gateway_id = aws_vpn_gateway.this.id
  route_table_id = module.vpc.public_route_table_ids[0]
}

resource "aws_vpn_connection_route" "this" {
  destination_cidr_block = "192.168.32.0/22"
  vpn_connection_id      = aws_vpn_connection.this.id
}

resource "aws_vpn_connection_route" "this1" {
  destination_cidr_block = "192.168.27.0/24"
  vpn_connection_id      = aws_vpn_connection.this.id
}





