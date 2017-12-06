#!/bin/bash

set -e

IP=$1

# Create cache
sed "s/___CORE_ENDPOINT___/${IP}/g" stream-cache-deploy.yaml | kubectl apply -f -
kubectl apply -f stream-cache-service.yaml

# Create frontend
kubectl apply -f frontend_nginx_config.yaml
# only once yet :(
kubectl apply -f frontend_pod.yaml 

sleep 10

IP="$(kubectl get po/frontend-client01 -o custom-columns=IP:.metadata.annotations.multi-ip-preferences | grep -oE "10.11.0.[0-9]{1,3}")"

echo "Frontend IP is: ${IP}"
