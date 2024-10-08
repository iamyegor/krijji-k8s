# Cert-manager

## Install using helm
``` sh
helm repo add jetstack https://charts.jetstack.io --force-update
```

``` sh
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.15.1 \
  --set crds.enabled=true
```

# Create yaml file based on nginx.conf

``` sh
kubectl create configmap image-server-nginx --from-file=templates/imageServer/nginx.conf -o yaml --dry-run=client > templates/imageServer/image-server-nginx.yaml
```