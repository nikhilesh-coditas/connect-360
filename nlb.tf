module "nlb" {
  source = "terraform-aws-modules/alb/aws"
  name   = "${var.product}-nlb"

  load_balancer_type = "network"

  vpc_id  = module.vpc.vpc_id
  subnets = [module.vpc.private_subnets[1], module.vpc.private_subnets[2]]

  internal = true

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "TCP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = module.ec2-nginx.id
          port      = 80
        }
      ]
    }
  ]

    https_listeners = [
      {
        port     = 443
        protocol = "TLS"
        certificate_arn    = "arn:aws:acm:ap-south-1:641312770660:certificate/90590889-8c4f-43d4-9a2c-36adeece0699"
        target_group_index = 0
        ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
      }
    ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = local.tags

  depends_on = [
    module.vpc,
    aws_security_group.nginx-sg
  ]
}
