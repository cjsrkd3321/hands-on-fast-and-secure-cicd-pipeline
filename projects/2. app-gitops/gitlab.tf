resource "gitlab_project" "this" {
  name                                  = var.service
  only_allow_merge_if_pipeline_succeeds = true
}

resource "gitlab_project_variable" "aws_role" {
  project = gitlab_project.this.id
  key     = "AWS_ROLE_ARN"
  value   = module.gitlab-oidc.iam_role_arn
  masked  = true
}

resource "gitlab_project_variable" "gitlab_token" {
  project = gitlab_project.this.id
  key     = "TF_VAR_GITLAB_TOKEN"
  value   = var.gitlab_token
  masked  = true
}

resource "gitlab_project_variable" "oidc_provider_arn" {
  project = gitlab_project.this.id
  key     = "TF_VAR_OIDC_PROVIDER_ARN"
  value   = module.gitlab-oidc.oidc_provider_arn
  masked  = true
}

resource "gitlab_project_variable" "kms_key_arn" {
  project = gitlab_project.this.id
  key     = "TF_VAR_KMS_KEY_ID"
  value   = aws_kms_key.this.key_id
  masked  = true
}

resource "gitlab_project_variable" "app_runner_service_role_arn" {
  project = gitlab_project.this.id
  key     = "TF_VAR_APP_RUNNER_SERVICE_ROLE_ARN"
  value   = aws_iam_role.this.arn
  masked  = true
}

resource "gitlab_repository_file" "this" {
  for_each = toset(fileset("${path.module}/files", "**"))

  project               = gitlab_project.this.id
  file_path             = each.key
  branch                = "main"
  content               = base64encode(file("files/${each.key}"))
  create_commit_message = "Add ${each.key}"
  delete_commit_message = "Delete ${each.key}"
  update_commit_message = "Update ${each.key}"
}
