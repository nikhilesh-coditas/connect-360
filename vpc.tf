module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.environment}-${var.product}-vpc"
  cidr = "10.1.0.0/16"

  azs                = ["${var.aws-region}a", "${var.aws-region}b", "${var.aws-region}c"]
  private_subnets    = ["10.1.20.0/24", "10.1.21.0/24", "10.1.22.0/24", "10.1.23.0/24"]
  public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  #tags                                               = var.vpc-tags
  database_subnet_assign_ipv6_address_on_creation    = false
  elasticache_subnet_assign_ipv6_address_on_creation = false
  enable_classiclink                                 = false
  enable_classiclink_dns_support                     = false
  outpost_subnet_assign_ipv6_address_on_creation     = false
  private_subnet_assign_ipv6_address_on_creation     = false
  public_subnet_assign_ipv6_address_on_creation      = false
  redshift_subnet_assign_ipv6_address_on_creation    = false
}

resource "aws_security_group" "lambda-sg" {
  name   = "lambda-sg"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }
}

resource "aws_security_group" "rds-sg" {
    name        = "rds-sg"
    vpc_id      = module.vpc.vpc_id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    security_groups = [aws_security_group.lambda-sg.id]
  }
}

resource "aws_security_group" "jenkins-sg" {
  name   = "jenkins-sg"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "nginx-sg" {
  name   = "nginx-sg"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

module "endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"

  vpc_id = module.vpc.vpc_id
  endpoints = {
    s3 = {
      service         = "s3"
      service_type    = "Gateway"
      route_table_ids = [module.vpc.private_route_table_ids[0]]
      tags            = { Name = "s3-vpc-endpoint" }
    }
  }

  tags = {}
}

resource "aws_vpc_endpoint_route_table_association" "s3-gw" {
  vpc_endpoint_id = module.endpoints.endpoints["s3"].id
  route_table_id  = module.vpc.private_route_table_ids[0]
}

resource "aws_route" "this" {
  route_table_id = module.vpc.public_route_table_ids[0]
  gateway_id = aws_vpn_gateway.this.id
  destination_cidr_block = "192.168.27.0/24"
}
resource "aws_route" "this1" {
  route_table_id = module.vpc.public_route_table_ids[0]
  gateway_id = aws_vpn_gateway.this.id
  destination_cidr_block = "192.168.32.0/22"
}
resource "aws_route" "this2" {
  route_table_id = module.vpc.private_route_table_ids[0]
  gateway_id = aws_vpn_gateway.this.id
  destination_cidr_block = "192.168.27.0/24"
}
resource "aws_route" "this3" {
  route_table_id = module.vpc.private_route_table_ids[0]
  gateway_id = aws_vpn_gateway.this.id
  destination_cidr_block = "192.168.32.0/22"
}

data "aws_security_group" "nginx" {
  id = aws_security_group.nginx-sg.id
}
data "aws_security_group" "jenkins" {
  id = aws_security_group.jenkins-sg.id
}


