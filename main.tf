provider "tfe" {
}

data "tfe_organization" "example" {
    name = var.org_name
}

resource "tfe_project" "example" {
    organization = data.tfe_organization.example.name
    name = var.project_name
}

data "tfe_oauth_client" "example" {
    organization = data.tfe_organization.example.name
    service_provider = var.service_provider
}

resource "tfe_workspace" "example" {
    name                 = var.workspace_name
    organization         = data.tfe_organization.example.name
    project_id           = tfe_project.example.id
    vcs_repo {
        branch             = var.workspace_vcs_repo_branch
        identifier         = var.workspace_vcs_repo_identifier
        oauth_token_id     = data.tfe_oauth_client.example.oauth_token_id
    }
    queue_all_runs = false
    working_directory = var.workspace_vcs_repo_working_directory
}

locals {
    ws_vars = [
        for wv in nonsensitive(var.workspace_variables) : {
            for k, v in wv : k => (k == "value" && wv.sensitive ? sensitive(v) : v)
        }
    ]
}

resource "tfe_variable" "example" {
    for_each = {
        for i, v in local.ws_vars :
        v.key => v
    }
    key          = each.value.key
    value        = each.value.value
    category     = each.value.category
    workspace_id = tfe_workspace.example.id
    description  = each.value.description
    sensitive    = each.value.sensitive
}