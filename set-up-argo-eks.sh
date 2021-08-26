NAMESPACE=argotest
echo "Creating namespace '$NAMESPACE'"
kubectl create namespace $NAMESPACE
echo "Installing Argo into namespace '$NAMESPACE'"
kubectl apply -n $NAMESPACE -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# CoreDNS has a node affinity taint thing to make it only run on EC2 but we want it to be able to run on fargate as well
kubectl patch deployment coredns \
    -n kube-system \
    --type json \
    -p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'

# TODO: takes longer than 10 seconds on EKS
exit
echo "Sleeping to allow admin password to be created..."
sleep 10
echo "Admin credentials are: Username=admin,Password=$(kubectl -n $NAMESPACE get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
