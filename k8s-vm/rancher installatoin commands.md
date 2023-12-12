```SH
# install k3s
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.24.10+k3s1" sh -

# fix permision
export KUBECONFIG=~/.kube/config
mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"

# rancher
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create namespace cattle-system
helm repo add jetstack https://charts.jetstack.io

helm repo update


helm install \
cert-manager jetstack/cert-manager \
--namespace cert-manager \
--create-namespace \
--version v1.13.3 \
--set installCRDs=true


helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=192.168.1.209.sslip.io \
  --set replicas=1 \
  --set bootstrapPassword=qwertyuiopqweertyu

# upgrade rancher
helm upgrade rancher rancher-latest/rancher --namespace cattle-system --set hostname=192.168.1.209.sslip.io --set replicas=2 --set bootstrapPassword=qwertyuiopqweertyu

# delete rancher
helm --namespace cattle-system delete rancher;  
```

