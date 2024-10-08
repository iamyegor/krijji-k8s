#!/bin/bash

# Add the NGINX Ingress Controller Helm repository
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# Create a namespace for the Ingress Controller
kubectl create namespace ingress-nginx

# Install the NGINX Ingress Controller using Helm
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx

# Wait for the Ingress Controller to be ready
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s

# Verify the installation
kubectl get pods -n ingress-nginx

echo "NGINX Ingress Controller installation completed."
echo "Note: By default, this installation creates a NodePort service."
echo "You can access the Ingress Controller through any node's IP address and the assigned NodePort."