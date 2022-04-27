variable "okta_api_token" {
  description = "the okta api token to manage okta resources"
}

variable "okta_org_name" {
  description = "the org_name to configure okta provider"
}

variable "okta_base_url" {
  description = "the base_url to configure okta provider"
  default     = "okta.com"
}
