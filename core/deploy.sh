#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

cd "${SCRIPTPATH}"

# Prepare vyos image mapping for virtlet
kubectl apply -f image-mapping.yml

# Create iperf
kubectl apply -f iperf_pod.yml
kubectl apply -f iperf_service.yml

# Create video converter
kubectl apply -f stream-source-deploy.yaml
kubectl apply -f stream-source-service.yaml

# Create VyOS
kubectl apply -f vyos.yml

