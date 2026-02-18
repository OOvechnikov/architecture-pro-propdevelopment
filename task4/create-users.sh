#!/bin/bash

kubectl create namespace access-demo

kubectl create serviceaccount cluster-viewer -n access-demo
kubectl create serviceaccount cluster-configurator -n access-demo
kubectl create serviceaccount admin -n access-demo

kubectl get serviceaccounts -n access-demo
