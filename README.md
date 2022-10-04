# kubernetes-base

## Setup the cluster

Install Docker Desktop on local machine.

Install [K3s](https://k3s.io/) on the server.

```bash
curl -sfL https://get.k3s.io | sh -
```

Get Kubernetes configuration and merge it with you local config in `~/.kube`.
Replace `default` with some better name and replace `127.0.0.1` with server IP.
```bash
cat /etc/rancher/k3s/k3s.yaml
```

Get cluster nodes from your local machine.
```bash
kubectl get nodes
```

## Creating secrets

Install `kubeseal` from [https://github.com/bitnami-labs/sealed-secrets/releases](latest releases)

```bash
./create-secret
```

## Unlock terraform

```bash
kubectl delete leases.coordination.k8s.io lock-tfstate-default-state -n default
```