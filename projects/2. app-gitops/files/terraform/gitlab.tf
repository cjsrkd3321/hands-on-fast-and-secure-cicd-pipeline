resource "gitlab_project" "this" {
  for_each = toset(local.apps)

  name                                  = each.key
  only_allow_merge_if_pipeline_succeeds = true
}

resource "gitlab_project_variable" "aws_role" {
  for_each = gitlab_project.this

  project = each.value.id
  key     = "AWS_ROLE_ARN"
  value   = module.gitlab-oidc[each.value.name].oidc_role
  masked  = true
}

resource "gitlab_project_variable" "ecr_repo_url" {
  for_each = gitlab_project.this

  project = each.value.id
  key     = "AWS_ECR_REPO_URL"
  value   = aws_ecr_repository.this[each.value.name].repository_url
  masked  = true
}

resource "gitlab_project_variable" "kms_key_id" {
  for_each = gitlab_project.this

  project = each.value.id
  key     = "AWS_KMS_KEY_ID"
  value   = var.KMS_KEY_ID
  masked  = true
}

resource "gitlab_project_variable" "app_runner_service_role_arn" {
  for_each = gitlab_project.this

  project = each.value.id
  key     = "AWS_APP_RUNNER_SERVICE_ROLE_ARN"
  value   = var.APP_RUNNER_SERVICE_ROLE_ARN
  masked  = true
}

resource "gitlab_repository_file" "gitlab_ci_yml" {
  for_each = gitlab_project.this

  project               = each.value.id
  file_path             = ".gitlab-ci.yml"
  branch                = "main"
  content               = base64encode(file("files/.gitlab-ci.yml"))
  create_commit_message = "Add .gitlab-ci.yml"
  delete_commit_message = "Delete .gitlab-ci.yml"
  update_commit_message = "Update .gitlab-ci.yml"
}

resource "gitlab_repository_file" "urls_txt" {
  for_each = gitlab_project.this

  project               = each.value.id
  file_path             = "urls.txt"
  branch                = "main"
  content               = base64encode(file("files/urls.txt"))
  create_commit_message = "Add urls.txt"
  delete_commit_message = "Delete urls.txt"
  update_commit_message = "Update urls.txt"
}
