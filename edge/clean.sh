#!/bin/bash

kubectl delete svc/stream-cache-client01 deploy/stream-cache-client01 configmap/nginx-client01 po/frontend-client01

exit 0
