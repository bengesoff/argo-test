# Test env for ArgoCD

Only for my personal testing.
Uses ArgoCD to deploy a Kafka cluster with the Confluent Kafka Helm charts.
Then there's a small Spring Boot application to produce messages to Kafka.

Does not follow best practice of separating source code and Helm repositories as I don't want multiple repos.

The application can be set up using the following rough steps:

1. Spin up an EKS cluster with ArgoCD using the Terraform environment in `infra/terraform`
2. Get ArgoCD credentials using script in `infra/scripts`
3. Build the Java application in `apps/process-service/process-event-logger-service`
4. Tag the resulting image and push to the ECR repo using the URL outputted by step 1
5. Log in to the ArgoCD admin UI using the details outputted by step 2
6. Using the ArgoCD UI, add the Kafka application in `charts/kafka` and synchronise it
7. Do the same for the `process-service` application in `charts/process-service` being sure to modify the `values.yaml` overrides to reference the image in the ECR repo
8. Set up a `kubectl port-forward` to the service created in step 7 and test the app
