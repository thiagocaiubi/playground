# istio

Install istio on minikube.

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)
 - [Minikube](https://minikube.sigs.k8s.io/)
 - [Istioctl](https://istio.io/latest/docs/setup/install/istioctl/)

# Steps

Minikube requires `hyperkit` to use load balancer in MacOS.

Reference:
 - https://github.com/kubernetes/minikube/pull/9496

```console
minikube start --vm-driver=hyperkit
```

```console
istioctl apply --filename istio-config.yaml --skip-confirmation
```

```console
kubectl apply --filename httpbin.yaml
```

```console
curl $(./gateway_url.sh)
```

```console
minikube delete
```
