#!/bin/bash

# Step 1: Set the Kubeconfig for your AWS EKS cluster
aws eks update-kubeconfig --name Hashicorp-vault

# Step 2: Set the namespace configuration
kubectl config set-context --current --namespace=findr-vault

# Step 3: Port-forward to the Vault service
kubectl port-forward svc/findr-vault 8200:8200 &

sleep 5

# Step 4: Open the Vault address in a web browser
if which xdg-open > /dev/null; then
  xdg-open "http://127.0.0.1:8200"
elif which open > /dev/null; then
  open "http://127.0.0.1:8200"
else
  echo "Unable to open a web browser. Please manually open the URL: http://127.0.0.1:8200"
fi
