variable "org_name" {
  default = ""
}

variable "workspace_name" {
  default = ""
}

variable "workspace_vcs_repo_branch" {
  default = ""
}

variable "workspace_vcs_repo_identifier" {
  default = ""
}

variable "workspace_vcs_repo_working_directory" {
  default = ""
}

variable "project_name" {
  default = ""
}

variable "service_provider" {
  default = ""
}

variable "workspace_variables" {
  default = []
  type = set(object({
    key         = string
    value       = string
    category    = string
    description = optional(string, "")
    sensitive   = bool
  }))
  sensitive = true
  validation {
    condition = length([
      for o in var.workspace_variables : true
      if contains(["terraform", "env"], o.category)
    ]) == length(var.workspace_variables)
    error_message = "workspace_variables.category must be either 'terraform' or 'env'"
  }
}

variable "tags_regex" {
  default = ""
}