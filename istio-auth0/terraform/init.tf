terraform {
  required_providers {
    auth0 = {
      source = "auth0/auth0"
    }
  }
}

provider "auth0" {
  domain        = local.env.auth0_domain
  client_id     = local.env.auth0_client_id
  client_secret = local.env.auth0_client_secret
  debug         = true
}
