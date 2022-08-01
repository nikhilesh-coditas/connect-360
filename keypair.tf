resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "this" {
  key_name   = "${var.product}-keypair"
  public_key = tls_private_key.this.public_key_openssh
  tags = {
    Environment             = local.environment
    Product                 = var.product
    Can_be_deleted          = true
    Created_using_terraform = true
  }
}


