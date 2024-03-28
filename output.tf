output "debug_local_ws_vars" {
  value = [for v in local.ws_vars : "Setting ${v.category} variable: ${v.key}:${v.sensitive ? "REDACTED" : v.value}"]
}

output "debug_workspace_variables" {
  value = [for k, v in tfe_variable.example : "Setting ${v.category} variable: ${v.key}, sensitive: ${v.sensitive}"]
}