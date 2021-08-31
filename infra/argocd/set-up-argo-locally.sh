NAMESPACE=argotest
echo "Creating namespace '$NAMESPACE'"
kubectl create namespace $NAMESPACE
echo "Installing Argo into namespace '$NAMESPACE'"
kubectl apply -n $NAMESPACE -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "Patching 'argocd-server' service to change to NodePort"
kubectl -n $NAMESPACE patch svc argocd-server -p '{"spec": {"type": "NodePort"}}'
echo "Argo UI is accessible at https://localhost:$(kubectl -n $NAMESPACE get svc argocd-server -o=jsonpath='{.spec.ports[?(@.port==443)].nodePort}')"
echo "Sleeping to allow admin password to be created..."
sleep 10
echo "Admin credentials are: Username=admin,Password=$(kubectl -n $NAMESPACE get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
