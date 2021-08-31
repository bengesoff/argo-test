echo "Creating namespace 'argocd'"
kubectl create namespace argocd
echo "Installing Argo into namespace 'argocd'"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "Opening up argocd-server service as LoadBalancer"
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
echo "Sleeping to allow admin password to be created..."
sleep 30
echo "Admin UI accessible at: https://$(kubectl -n argocd get svc argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')"
echo "Admin credentials are: Username=admin,Password=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
