# Infrastructure

The `terraform` directory provisions an Amazon EKS cluster and installs ArgoCD onto it, in the `argocd` namespace.
A script in `scripts` then retrieves the ArgoCD admin credentials to log in and install other Helm charts to the cluster.
A `kubeconfig` file is generated and should be exported as an environment variable to use `kubectl` commands, for example:

```
cd infra/terraform
terraform init
terraform apply
export KUBECONFIG=$(pwd)/$(terraform output -raw kubeconfig)
kubectl get all -n argocd
cd ..
./scripts/get-admin-ui-credentials.sh
```

The UI can then be accessed using the given credentials and be used to install the other Helm charts in this repo.
