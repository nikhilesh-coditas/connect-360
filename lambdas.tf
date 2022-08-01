locals {
  lambdas = {
    for i in local.lambdas_list :
    "${local.environment}_${var.product}_${i.resource_name}" => i
  }
  lambdas_list = [
    {
      resource_name       = "lambda-apigateway-authorizer"
      memory_size         = 128
      handler             = "lambda_apigateway_authorizer.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "create-role"
      memory_size         = 128
      handler             = "create_role.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },

    {
      resource_name       = "get-artifacts"
      memory_size         = 128
      handler             = "get_artifacts.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "update-team"
      memory_size         = 128
      handler             = "update_team.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "audio_recording_validation"
      memory_size         = 128
      handler             = "audio_recording_validation.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-campaign"
      memory_size         = 128
      handler             = "lambda_function.lambda_handler"
      timeout             = 3
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "data_validation"
      memory_size         = 128
      handler             = "data_validation.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "lead_validator"
      memory_size         = 128
      handler             = "lead_validator.lambda_handler"
      timeout             = 900
      runtime             = "python3.9"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-user"
      memory_size         = 128
      handler             = "list_user.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "retrieve-team"
      memory_size         = 128
      handler             = "retrieve_team.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "verify-auth-token"
      memory_size         = 128
      handler             = "verify_auth_token.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "get-ad-user-info"
      memory_size         = 128
      handler             = "get_ad_user_info.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-shift-timings"
      memory_size         = 128
      handler             = "list_shift_timings.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "get-auth-url"
      memory_size         = 128
      handler             = "get_auth_url.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-countries"
      memory_size         = 128
      handler             = "list_countries.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "create-user"
      memory_size         = 128
      handler             = "create_user.lambda_handler"
      timeout             = 30
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-team"
      memory_size         = 128
      handler             = "list_team.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-role"
      memory_size         = 128
      handler             = "list_role.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "retrive-review"
      memory_size         = 128
      handler             = "lambda_function.lambda_handler"
      timeout             = 3
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "get-teams"
      memory_size         = 128
      handler             = "get_teams.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "delete-user"
      memory_size         = 128
      handler             = "delete_user.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "codeArtifctTest"
      memory_size         = 128
      handler             = "lambda_function.lambda_handler"
      timeout             = 3
      runtime             = "python3.9"
      policy              = null
      attach_extra_policy = false
      s3_key              = "healthCheck"
    },
    {
      resource_name       = "update-user"
      memory_size         = 128
      handler             = "update_user.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "geo_validation"
      memory_size         = 128
      handler             = "geo_validation.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "retrieve-campaign"
      memory_size         = 128
      handler             = "lambda_function.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "update-role"
      memory_size         = 128
      handler             = "update_role.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "retrieve-role"
      memory_size         = 128
      handler             = "retrieve_role.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-review"
      memory_size         = 128
      handler             = "lambda_function.lambda_handler"
      timeout             = 3
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "delete-team"
      memory_size         = 128
      handler             = "delete_team.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "retrieve-user"
      memory_size         = 128
      handler             = "retrieve_user.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-departments"
      memory_size         = 128
      handler             = "list_departments.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "delete-role"
      memory_size         = 128
      handler             = "delete_role.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "refresh-token"
      memory_size         = 128
      handler             = "refresh_token.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "briteverify_check"
      memory_size         = 128
      handler             = "briteverify_check.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "create-team"
      memory_size         = 128
      handler             = "create_team.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "create-campaign-note"
      memory_size         = 128
      handler             = "create-campaign-note.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "update-campaign"
      memory_size         = 128
      handler             = "update-campaign.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "add-team-allocation"
      memory_size         = 128
      handler             = "add-team-allocation.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "update-team-allocation"
      memory_size         = 128
      handler             = "update-team-allocation.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
    {
      resource_name       = "list-clients"
      memory_size         = 128
      handler             = "list_clients.lambda_handler"
      timeout             = 900
      runtime             = "python3.8"
      s3_key              = "healthCheck"
      policy              = null
      attach_extra_policy = false
    },
  ]
}