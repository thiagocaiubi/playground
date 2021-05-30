resource "kubernetes_namespace" "sso" {
  metadata {
    name = "sso"

    labels = {
      name            = "sso"
      istio-injection = "enabled"
    }
  }
}

resource "random_password" "oauth2_proxy_cookie_secret" {
  length  = 16
  special = true
}

resource "kubernetes_secret" "oauth2_proxy" {
  metadata {
    namespace = kubernetes_namespace.sso.metadata.0.name
    name      = "oauth2-proxy"
  }

  data = {
    client_secret = okta_app_oauth.sso.client_secret
    cookie_secret = random_password.oauth2_proxy_cookie_secret.result
  }
}

resource "kubernetes_config_map" "oauth2_proxy" {
  metadata {
    namespace = kubernetes_namespace.sso.metadata.0.name
    name      = "oauth2-proxy"
  }

  data = {
    client_id = okta_app_oauth.sso.client_id

    login_url = format(
      "https://%s.%s/oauth2/default/v1/authorize",
      local.okta_org_name,
      local.okta_base_url
    )

    oidc_issuer_url = format(
      "https://%s.%s/oauth2/default",
      local.okta_org_name,
      local.okta_base_url
    )

    oidc_jwks_url = format(
      "https://%s.%s/oauth2/default/.well-known/oauth-authorization-server?client_id=%s",
      local.okta_org_name,
      local.okta_base_url,
      okta_app_oauth.sso.client_id
    )

    redeem_url = format(
      "https://%s.%s/oauth2/default/v1/token",
      local.okta_org_name,
      local.okta_base_url
    )

    validate_url = format(
      "https://%s.%s/oauth2/default/v1/userinfo",
      local.okta_org_name,
      local.okta_base_url
    )
  }
}
