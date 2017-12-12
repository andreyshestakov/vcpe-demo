#!/bin/bash

set -e

IP="$(kubectl get po/frontend-client01 -o custom-columns=IP:.metadata.annotations.multi-ip-preferences | grep -oE "10.11.0.[0-9]{1,3}")"

echo "${IP}"
