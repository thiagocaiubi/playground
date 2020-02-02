# AWS

Manage AWS resources with Terraform.

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)
 - [Provide](https://www.terraform.io/docs/providers/aws/index.html#environment-variables)
AWS credentials via environment variables

## Build image

```console
make image
```

## Manage resources

Start interactive shell session inside the container

```console
make shell
```

Initialize terraform providers

```
terraform init
```

Apply terraform configuration

```
terraform apply
```
