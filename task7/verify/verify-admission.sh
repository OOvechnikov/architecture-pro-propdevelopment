#!/bin/bash

echo "Testing insecure manifests"
kubectl apply -f insecure-manifests/ || echo "Blocked as expected"

echo "Testing secure manifests"
kubectl apply -f secure-manifests/
