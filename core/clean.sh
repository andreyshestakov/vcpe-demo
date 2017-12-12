#!/bin/bash

kubectl -n kube-system  delete virtletimagemapping primary

kubectl delete svc/iperf-client01 po/iperf-client01 deploy/stream-source-client01 svc/stream-source-client01 po/vyos

exit 0
