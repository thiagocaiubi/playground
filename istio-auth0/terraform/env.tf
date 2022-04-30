# Reads local .env file and exports its content as locals in Terraform.
# Example, the .env file with the content:
# xpto=ijk
# would turn into local.env.xpto with the value ijk during Terraform execution.
locals {
  env = { for tuple in regexall("(.*)=(.*)", file("./.env")) : tuple[0] => tuple[1] }
}
