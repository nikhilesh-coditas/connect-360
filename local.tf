locals {
  environment = terraform.workspace == "default" ? "int" : terraform.workspace
  region = "ap-south-1"
  tags = {
    Terraform   = "true"
    environment = local.environment
  }
  environment_variables = {
    region = local.region
  }
  # #### s3 locals ####
  website = {
    error_document = "index.html"
    index_document = "index.html"
  }
  versioning    = {}
  bucket_policy = <<EOF
    {
        "Version":"2012-10-17",
        "Statement":[{
            "Sid":"2",
            "Effect":"Allow",
            "Principal":"*",
            "Action":"s3:GetObject",
            "Resource":"arn:aws:s3:::${local.environment}-${var.product}-website/*",
            "Condition": {
                "StringEquals": {
                    "aws:sourceVpce": "${module.endpoints.endpoints["s3"].id}"
                    }}
            }]
    }
   EOF 

  ### ec2 locals ####

  # instance = {
  #     for i in local.instance_list :
  #     "${local.environment}_${var.product}_${i.name}" => i
  # }

  # instance_list = {
  #     nginx = {
  #         name = "nginx"
  #         ami = "ami-068257025f72f470d"
  #         instance_type = "t2.micro"
  #         security_group = data.aws_security_group.nginx.id
  #         subnet = module.vpc.private_subnets[1]
  #         user_data = null
  #     },
  #     jenkins = {
  #         name = "jenkins"
  #         ami = "ami-068257025f72f470d"
  #         instance_type = "t2.micro"
  #         security_group = data.aws_security_group.jenkins.id
  #         subnet = module.vpc.private_subnets[0]
  #         user_data = null
  #     }
  # }


  ###################### rds ########################
  
}