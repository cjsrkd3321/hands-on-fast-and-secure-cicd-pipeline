resource "aws_ecr_repository" "this" {
  for_each = gitlab_project.this

  name         = "${each.value.name}-ecr-repository"
  force_delete = true

  encryption_configuration {
    encryption_type = "AES256"
  }
}
