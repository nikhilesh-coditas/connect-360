module "lambdas" {
  source                    = "git::https://nikhilesh-inventive@bitbucket.org/ws-inventive/tf-modules.git//lambda"
  for_each                  = local.lambdas
  environment               = local.environment
  bucket_name               = module.lambda-package.s3_bucket_id
  s3_key                    = each.value.s3_key
  handler                   = each.value.handler
  product                   = var.product
  assume_role_policy        = var.assume_role_policy
  memory_size               = each.value.memory_size
  policy                    = each.value.policy
  attach_extra_policy       = each.value.attach_extra_policy
  runtime                   = each.value.runtime
  timeout                   = each.value.timeout
  resource_name             = each.value.resource_name
  environment_variables     = local.environment_variables
  lambda_subnet_ids         = [module.vpc.private_subnets[0],module.vpc.private_subnets[1]]
  lambda_security_group_ids = [aws_security_group.lambda-sg.id]
}
resource "aws_api_gateway_authorizer" "this" {
  name                   = "connect360-authorizer"
  rest_api_id            = module.api-gateway.api_gateway.id
  authorizer_uri         = module.lambdas["int_connect360_lambda-apigateway-authorizer"].lambda_function_invoke_arn
}

module "api-gateway" {
  source        = "git::https://nikhilesh-inventive@bitbucket.org/ws-inventive/tf-modules.git//api-gateway"
  # for_each      = local.lambdas
  environment   = local.environment
  product       = var.product
  api_resources = local.api_resources
  api_methods   = local.api_methods
  depends_on = [
    module.lambdas
  ]
}