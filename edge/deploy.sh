#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

cd "${SCRIPTPATH}"

IP=$1

# Create cache
sed "s/___CORE_ENDPOINT___/${IP}/g" stream-cache-deploy.yaml | kubectl apply -f -
kubectl apply -f stream-cache-service.yaml

# Create frontend
kubectl apply -f frontend_nginx_config.yaml
# only once yet :(
kubectl apply -f frontend_pod.yaml 

