module "ec2-nginx" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 3.0"
  name                   = "nginx-proxy-server"
  ami                    = "ami-068257025f72f470d"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.this.key_name
  monitoring             = true
  vpc_security_group_ids = [data.aws_security_group.nginx.id]
  subnet_id              = module.vpc.private_subnets[1]
  #user_data              = local.user_data

  tags = local.tags
  depends_on = [
    module.vpc,
    aws_security_group.nginx-sg
  ]
}
module "ec2-jenkins" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 3.0"
  name                   = "jenkins-server"
  ami                    = "ami-08df646e18b182346"
  instance_type          = "t3.medium"
  key_name               = aws_key_pair.this.key_name
  monitoring             = true
  vpc_security_group_ids = [data.aws_security_group.jenkins.id]
  subnet_id              = module.vpc.private_subnets[1]
  # user_data              = <<EOF
  # sudo yum update 
  
  # sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  # sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  # sudo yum install jenkins -y
  # sudo systemctl start jenkins
  # sudo systemctl enable jenkins
  # sudo yum install git -y
  # sudo yum install npm -y
  # sudo curl --silent --location https://rpm.nodesource.com/setup_16.x | bash -
  # sudo yum install -y nodejs
  # sudo npm install -g @angular/cli
  # sudo npm install -g npm@8.13.2
  # EOF

  tags = local.tags
  depends_on = [
    module.vpc,
    aws_security_group.jenkins-sg
  ]
}



