output "docker_image_repo_url" {
  description = "The URL of the AWS ECR docker image repository"
  value       = aws_ecr_repository.images.repository_url
}

output "kubeconfig" {
  description = "The filename of the kubeconfig file generated for authenticating to the AWS EKS cluster"
  value       = module.eks.kubeconfig_filename
}
