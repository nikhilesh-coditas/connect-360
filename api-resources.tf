locals {
  api_resources = {
    list-campaign = {
      resource_name      = "list-campaign"
      parent_resource_id = "root"
      child_name         = null
    },
    create-team = {
      resource_name      = "create-team"
      parent_resource_id = "root"
      child_name         = null
    },
    get-auth-url = {
      resource_name      = "get-auth-url"
      parent_resource_id = "root"
      child_name         = null
    },
    list-review = {
      resource_name      = "list-review"
      parent_resource_id = "root"
      child_name         = null
    },
    get-teams = {
      resource_name      = "get-teams"
      parent_resource_id = "root"
      child_name         = null
    },
    retrieve-team = {
      resource_name      = "retrieve-team"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    update-role = {
      resource_name      = "update-role"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    retrieve-role = {
      resource_name      = "retrieve-role"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    list-departments = {
      resource_name      = "list-departments"
      parent_resource_id = "root"
      child_name         = null
    },
    get-ad-user-info = {
      resource_name      = "get-ad-user-info"
      parent_resource_id = "root"
      child_name         = "{email}"
    },
    update-team = {
      resource_name      = "update-team"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    update-user = {
      resource_name      = "update-user"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    delete-team = {
      resource_name      = "delete-team"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    retrieve-user = {
      resource_name      = "retrieve-user"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    create-user = {
      resource_name      = "create-user"
      parent_resource_id = "root"
      child_name         = null
    },
    list-user = {
      resource_name      = "list-user"
      parent_resource_id = "root"
      child_name         = null
    },
    delete-role = {
      resource_name      = "delete-role"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    delete-user = {
      resource_name      = "delete-user"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    list-shift-timings = {
      resource_name      = "list-shift-timings"
      parent_resource_id = "root"
      child_name         = null
    },
    list-countries = {
      resource_name      = "list-countries"
      parent_resource_id = "root"
      child_name         = null
    },
    create-role = {
      resource_name      = "create-role"
      parent_resource_id = "root"
      child_name         = null
    },
    verify-auth-token = {
      resource_name      = "verify-auth-token"
      parent_resource_id = "root"
      child_name         = null
    },
    list-team = {
      resource_name      = "list-team"
      parent_resource_id = "root"
      child_name         = null
    },
    retrive-review = {
      resource_name      = "retrive-review"
      parent_resource_id = "root"
      child_name         = null
    },
    get-artifacts = {
      resource_name      = "get-artifacts"
      parent_resource_id = "root"
      child_name         = null
    },
    refresh-token = {
      resource_name      = "refresh-token"
      parent_resource_id = "root"
      child_name         = null
    },
    list-role = {
      resource_name      = "list-role"
      parent_resource_id = "root"
      child_name         = null
    },
    retrieve-campaign = {
      resource_name      = "retrieve-campaign"
      parent_resource_id = "root"
      child_name         = "{id}"
    },
    create-campaign-note = {
      resource_name      = "create-campaign-note"
      parent_resource_id = "root"
      child_name         = null
    },
    update-campaign = {
      resource_name      = "update-campaign"
      parent_resource_id = "root"
      child_name         = null
    },
    add-team-allocation = {
      resource_name      = "add-team-allocation"
      parent_resource_id = "root"
      child_name         = null
    },
    update-team-allocation = {
      resource_name      = "update-team-allocation"
      parent_resource_id = "root"
      child_name         = null
    },
  }
}