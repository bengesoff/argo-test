resource "aws_ecr_repository" "images" {
  name = lower(local.cluster_name)
}
