locals {
  api_methods = {
    for k, v in local.api_methods_list :
    k => merge(v,
      { authorizer_id       = aws_api_gateway_authorizer.this.id 
        function_name       = module.lambdas["${local.environment}_${var.product}_${v.resource_name}"].lambda_function_name
        function_invoke_arn = module.lambdas["${local.environment}_${var.product}_${v.resource_name}"].lambda_function_invoke_arn
    })
  }
  api_methods_list = {
    list-campaign = {
      resource_name    = "list-campaign"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    create-team = {
      resource_name    = "create-team"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    get-auth-url = {
      resource_name    = "get-auth-url"
      http_method      = "GET"
      authorization    = "NONE"
      child_name       = null
      api_key_required = false
    },
    list-review = {
      resource_name    = "list-review"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    get-teams = {
      resource_name    = "get-teams"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    update-role = {
      resource_name    = "update-role"
      http_method      = "PUT"
      authorization    = "CUSTOM"
      child_name       = "{id},"
      api_key_required = false
    },

    list-departments = {
      resource_name    = "list-departments"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    update-team = {
      resource_name    = "update-team"
      http_method      = "PUT"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    update-user = {
      resource_name    = "update-user"
      http_method      = "PUT"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    retrieve-role = {
      resource_name    = "retrieve-role"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    delete-team = {
      resource_name    = "delete-team"
      http_method      = "DELETE"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    retrieve-user = {
      resource_name    = "retrieve-user"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    create-user = {
      resource_name    = "create-user"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    list-user = {
      resource_name    = "list-user"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    delete-role = {
      resource_name    = "delete-role"
      http_method      = "DELETE"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    delete-user = {
      resource_name    = "delete-user"
      http_method      = "DELETE"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    list-shift-timings = {
      resource_name    = "list-shift-timings"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    list-countries = {
      resource_name    = "list-countries"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    get-ad-user-info = {
      resource_name    = "get-ad-user-info"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    retrieve-team = {
      resource_name    = "retrieve-team"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    create-role = {
      resource_name    = "create-role"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    verify-auth-token = {
      resource_name    = "verify-auth-token"
      http_method      = "POST"
      authorization    = "NONE"
      child_name       = null
      api_key_required = false
    },
    list-team = {
      resource_name    = "list-team"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    retrive-review = {
      resource_name    = "retrive-review"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    get-artifacts = {
      resource_name    = "get-artifacts"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    refresh-token = {
      resource_name    = "refresh-token"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    list-role = {
      resource_name    = "list-role"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    retrieve-campaign = {
      resource_name    = "retrieve-campaign"
      http_method      = "GET"
      authorization    = "CUSTOM"
      child_name       = "{id}"
      api_key_required = false
    },
    create-campaign-note = {
      resource_name    = "create-campaign-note"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    update-campaign = {
      resource_name    = "update-campaign"
      http_method      = "PUT"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    add-team-allocation = {
      resource_name    = "add-team-allocation"
      http_method      = "POST"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    },
    update-team-allocation = {
      resource_name    = "update-team-allocation"
      http_method      = "PUT"
      authorization    = "CUSTOM"
      child_name       = null
      api_key_required = false
    }
  }
}