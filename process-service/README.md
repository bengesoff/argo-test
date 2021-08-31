# Process Event Logger Service

Small Spring Boot application to produce messages to Kafka.

It exposes a simple REST interface (1 endpoint) which accepts "process events" and publishes them to a Kafka topic called "test".
These events consist of a process code representing the process completed and a process outcome representing the status (e.g. pass or fail).

The docker image can be built using Gradle from within the Java root directory:

```
./gradlew bootBuildImage --imageName=process-service
```

The image can then either be used locally or pushed to an ECR image repository.
The helm chart's `values.yaml` file should be updated to reflect the location of the image.

## API

The service has one REST endpoint, `POST /process`.
This accepts a JSON object in the request body which will be serialised and sent to Kafka.
For example:

```
curl -X POST -d '{"processCode": "ASM_002", "processOutcome": "PASS"}' -H "Content-Type: application/json" http://localhost:8080/process
```
