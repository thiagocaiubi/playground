#!/bin/bash

ingress_host=$(minikube ip)
ingress_port=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')

echo "http://${ingress_host}:${ingress_port}"
