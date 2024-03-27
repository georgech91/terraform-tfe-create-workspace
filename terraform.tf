terraform {
    cloud {
        organization = "georg"
        workspaces {
            name = "init"
        }
    }
    required_providers {
        tfe = {
            source = "hashicorp/tfe"
            version = "0.53.0"
        }
    }
}