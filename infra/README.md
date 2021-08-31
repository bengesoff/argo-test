# Infrastructure

This directory contains two things: a Terraform environment for configuring Amazon EKS, and some scripts for configuring ArgoCD in the resulting cluster.
The Terraform environment should be deployed first.
Then the generated `kubeconfig` file should be exported as an environment variable, for example:

```
export KUBECONFIG=$(pwd)/kubeconfig_argo-test-naseic48rye
```

Finally the `set-up-argo-eks.sh` script can be run to install ArgoCD to the `argocd` namespace.
The UI can then be accessed using the given credentials and be used to install the other Helm charts in this repo.
