# istio-auth0

Secure a Single Page Application (SPA) with Istio and Auth0 on minikube.

This sample explores Request Authentication and Authorizaion Policies.

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)
 - [Minikube](https://minikube.sigs.k8s.io/)
 - [Istioctl](https://istio.io/latest/docs/setup/install/istioctl/)
 - [Auth0](https://www.auth0.com)

# Steps

TODO: add docs regarding Auth0 Management API configuration.

Start minikube:

```console
minikube start
```

Install istio in the cluster:

```console
istioctl apply --filename ./k8s/01-istio-config/istio-config.yaml --skip-confirmation
```

TODO: add docs regarding the .env configuration.

Configure auth0 and some kubernetes resources. In the [./terraform](./terraform) directory:

```console
terraform init && \
    terraform apply
```

Configure remaining kubernetes resources:

```console
kubectl apply \
    --filename ./k8s/02-istio \
    --filename ./k8s/03-auth0-spa \
    --filename ./k8s/04-http-dump
```

Establish a tunnel between minikube and the host machine:

```console
minikube tunnel
```

Navigate to [http://localhost]()

Clean up:

```
minikube delete
```

```
cd ./terraform && terraform destroy
```
