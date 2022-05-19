Article:
- https://cloud.google.com/architecture/using-istio-for-internal-load-balancing-of-grpc-services

Github repository:
- https://github.com/GoogleCloudPlatform/istio-samples/tree/master/sample-apps/grpc-greeter-go

Steps:

```console
docker build client -t thiagocaiubi/grpc-greeter-go-client

docker push thiagocaiubi/grpc-greeter-go-client

docker build server -t thiagocaiubi/grpc-greeter-go-server

docker push thiagocaiubi/grpc-greeter-go-server

istioctl install -y --filename k8s/istio-operator.yaml

kubectl label namespace default istio-injection=enabled

kubectl apply --filename k8s/greeter-k8s.template.yaml \
    --filename k8s/greeter-istio-gateway.yaml \
    --filename k8s/greeter-istio-virtualservice.yaml \
    --filename k8s/greeter-istio-destinationrule.yaml

kubectl run -n client --rm -i --tty  --image=thiagocaiubi/grpc-greeter-go-client -- bash
```

Inside the container:

```console
# call service directly
go run client.go -insecure=true -address=greeter.default.svc.cluster.local

# call the istio gateway
go run client.go -insecure=true -address=istio-ingressgateway.istio-system.svc.cluster.local
```
