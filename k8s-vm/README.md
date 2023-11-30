
Clone git repoitory

```sh
mkdir -p rancher-deploy
cd rancher-deploy
git clone https://github.com/rancher/quickstart
```

```sh
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.28.3+k3s2" sh -s - server --cluster-init
```

```sh
scp -i ssh_keys/vmkey root@192.168.1.209:/etc/rancher/k3s/k3s.yaml config
```

```sh
docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  -v /home/vagrant/rancher-docker/rancher:/var/lib/rancher \
  --privileged \
  rancher/rancher:latest
```

```sh
docker run -d --restart=unless-stopped \
  -p 8080:80 -p 8443:443 \
  -v ./rancher-data:/var/lib/rancher \
  --privileged \
  rancher/rancher:latest

```
https://ranchermanager.docs.rancher.com/pages-for-subheaders/rancher-on-a-single-node-with-docker#option-a-default-rancher-generated-self-signed-certificate

https://ranchermanager.docs.rancher.com/reference-guides/single-node-rancher-in-docker/advanced-options