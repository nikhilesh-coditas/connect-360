module "s3-bucket" {
  source               = "terraform-aws-modules/s3-bucket/aws"
  version              = "3.3.0"
  acl                  = "private"
  bucket               = "${local.environment}-${var.product}-website"
  policy               = local.bucket_policy
  attach_policy        = true
  attach_public_policy = false
  request_payer        = "BucketOwner"
  versioning           = local.versioning
  website              = local.website
  create_bucket        = true
  # block_public_acls    = true
  # block_public_policy  = true
  # restrict_public_buckets = true
  #ignore_public_acls = true
}
module "key-bucket" {
  source               = "terraform-aws-modules/s3-bucket/aws"
  version              = "3.3.0"
  acl                  = "private"
  bucket               = "${var.product}-key-bucket"
  policy               = local.bucket_policy
  attach_policy        = false
  attach_public_policy = false
  request_payer        = "BucketOwner"
  create_bucket        = true
  # block_public_acls    = true
  # block_public_policy  = true
  # restrict_public_buckets = true
  #ignore_public_acls = true
}

resource "aws_s3_object" "this" {
  count    = var.save_private_key ? 1 : 0
  key      = aws_key_pair.this.key_name
  bucket   = module.key-bucket.s3_bucket_id
  content  = tls_private_key.this.private_key_pem
  tags     = local.tags
  metadata = {}
}

module "lambda-layers" {
  source               = "terraform-aws-modules/s3-bucket/aws"
  version              = "3.3.0"
  acl                  = "private"
  bucket               = "${local.environment}-${var.product}-lambda-layers"
  policy               = local.bucket_policy
  attach_policy        = false
  attach_public_policy = false
  request_payer        = "BucketOwner"
  create_bucket        = true
}

resource "aws_s3_object" "lambda-layers" {
  key      = "healthCheck"
  bucket   = module.lambda-layers.s3_bucket_id
  source  = "D:\\healthCheck.zip"
  tags     = local.tags
  metadata = {}
}
module "lambda-package" {
  source               = "terraform-aws-modules/s3-bucket/aws"
  version              = "3.3.0"
  acl                  = "private"
  bucket               = "${local.environment}-${var.product}-lambda-package"
  policy               = local.bucket_policy
  attach_policy        = false
  attach_public_policy = false
  request_payer        = "BucketOwner"
  create_bucket        = true
}

resource "aws_s3_object" "lambda-package" {
  key      = "healthCheck"
  bucket   = module.lambda-package.s3_bucket_id
  source  = "D:\\healthCheck.zip"
  tags     = local.tags
  metadata = {}
}

output "name" {
  value = module.lambda-layers
}