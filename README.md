# Test env for ArgoCD

Only for my personal testing.
Uses ArgoCD to deploy a Kafka cluster with the Confluent Kafka Helm charts.
Then there's a small Spring Boot application to produce messages to Kafka.

The application can be set up using the following rough steps:

1. Spin up an EKS cluster using the Terraform environment in `infra/eks`
2. Install ArgoCD to the cluster using the script in `infra/argocd`
3. Build the Java application in `process-service/process-event-logger-service`
4. Tag the resulting image and push to the ECR repo using the URL outputted by step 1
5. Log in to the ArgoCD admin UI using the details outputted by step 2
6. Using the ArgoCD UI, add the Kafka application in `kafka/helm` and synchronise it
7. Do the same for the `process-service` application in `process-service/helm` being sure to modify the `values.yaml` overrides to reference the image in the ECR repo
8. Set up a `kubectl port-forward` to the service created in step 7 and test the app
