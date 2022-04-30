resource "auth0_client" "sso" {
  name                       = "client: istio auth0 local"
  app_type                   = "spa"
  oidc_conformant            = true
  token_endpoint_auth_method = "none"

  grant_types = [
    "authorization_code",
    "refresh_token",
  ]

  allowed_logout_urls = [
    "http://localhost",
  ]

  callbacks = [
    "http://localhost",
  ]

  web_origins = [
    "http://localhost",
  ]

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_resource_server" "oauth2_server" {
  name             = "resource server: istio auth0 local"
  identifier       = "https://sso.caiubi.com"
  enforce_policies = true
  token_dialect    = "access_token_authz"

  scopes {
    value       = "read:http-dump"
    description = "Read http-dump service"
  }
}

resource "auth0_client_grant" "oauth2_scope" {
  client_id = auth0_client.sso.id
  audience  = auth0_resource_server.oauth2_server.identifier
  scope     = ["read:http-dump"]
}
