resource "okta_app_oauth" "sso" {
  label          = "istio okta local"
  type           = "web"
  grant_types    = ["authorization_code", "refresh_token"]
  response_types = ["code"]

  login_uri = "http://istio-okta.local/"

  redirect_uris = [
    "http://istio-okta.local/",
    "http://istio-okta.local/oauth2/callback",
  ]

  post_logout_redirect_uris = ["http://istio-okta.local/"]

  lifecycle {
    ignore_changes = [groups, users]
  }
}

resource "okta_group" "httpbin" {
  name        = "httpbin"
  description = "httpbin"

  lifecycle {
    ignore_changes = [users]
  }
}

resource "okta_app_group_assignment" "httpbin" {
  app_id   = okta_app_oauth.sso.id
  group_id = okta_group.httpbin.id
}

data "okta_auth_server" "default" {
  name = "default"
}

resource "okta_auth_server_claim" "httpbin" {
  auth_server_id    = data.okta_auth_server.default.id
  name              = "groups"
  value             = okta_group.httpbin.name
  value_type        = "GROUPS"
  claim_type        = "RESOURCE"
  group_filter_type = "EQUALS"
}
