#!/bin/bash

set -e

IP="$(kubectl describe po vyos | grep "^IP:" | awk '{print $2}')"

echo "${IP}"

