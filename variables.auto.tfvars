org_name = "georg"
workspace_name = "tf-gke"
workspace_vcs_repo_branch = "main"
workspace_vcs_repo_identifier = "georgech91/terraform-gcp"
workspace_vcs_repo_working_directory = "gke"
project_name = "tfc-demo"
service_provider = "github"
workspace_variables = [ 
    {
        key = "example-key",
        value = "example-value",
        category = "terraform",
        sensitive = false
    },
    {
        key = "SECRET_KEY",
        value = "secret-value",
        category = "env",
        sensitive = true
    },
    # {
    #     key = "invalid-category",
    #     value = "invalid-category",
    #     category = "invalid",
    #     sensitive = false
    # },
]