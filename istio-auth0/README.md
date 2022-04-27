# istio-auth0

Secure istio with auth0 and
[oauth2-proxy](https://oauth2-proxy.github.io/oauth2-proxy/)
on minikube.

This sample explores Istio's External Authorization, Request Authentication and
Authorizaion Policies.

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)
 - [Minikube](https://minikube.sigs.k8s.io/)
 - [Istioctl](https://istio.io/latest/docs/setup/install/istioctl/)
 - [Okta](https://www.auth0.com)

# Steps

Create Okta API token, follow the instructions
[here](https://developer.okta.com/docs/guides/create-an-api-token/overview/).
Then, find your organization name and domain, follow the instructions
[here](https://developer.okta.com/docs/guides/find-your-domain/findorg/).


Start minikube:

```console
minikube start
```

Install istio in the cluster:

```console
istioctl apply --filename ./k8s/01-istio-config/istio-config.yaml --skip-confirmation
```

Configure auth0 and some kubernetes resources. In the [./terraform](./terraform) directory:

```console
terraform init && \
    TF_VAR_auth0_api_token=<token> \
    TF_VAR_auth0_org_name=<org name> \
    terraform apply
```

Configure remaining kubernetes resources:

```console
kubectl apply \
    --filename ./k8s/02-istio \
    --filename ./k8s/03-sso \
    --filename ./k8s/04-home \
    --filename ./k8s/05-httpbin
```

Establish a tunnel between minikube and the host machine:

```console
minikube tunnel
```

Edit `/etc/hosts` with:

```
127.0.0.1 istio-auth0.local
```

Navigate to [http://istio-auth0.local]()

Clean up:

```
minikube delete
```
