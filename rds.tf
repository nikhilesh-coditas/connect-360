module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${local.environment}-${var.product}-database"
  engine                 = "postgres"
  engine_version         = "12.8"
  instance_class         = var.db-instance-class
  allocated_storage      = 20
  max_allocated_storage = 100
  port                   = 5432
  db_name                = "postgres"
  username               = var.db-username
  password               = var.db-password
  availability_zone      = "${var.aws-region}a"
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  major_engine_version  = "12.8"
  family = "postgres"
  create_db_option_group = false
  create_db_parameter_group = false
  maintenance_window = "Sun:00:00-Sun:03:00"
  backup_window      = "03:00-06:00"

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [module.vpc.private_subnets[2], module.vpc.private_subnets[3]]

  # Database Deletion Protection
  deletion_protection = true
}