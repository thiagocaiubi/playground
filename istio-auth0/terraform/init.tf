terraform {
  required_providers {
    okta = {
      source  = "oktadeveloper/okta"
    }
  }
}

provider "okta" {
  org_name  = var.okta_org_name
  base_url  = var.okta_base_url
  api_token = var.okta_api_token
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}
