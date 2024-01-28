module "gitlab-oidc" {
  source = "ganexcloud/gitlab-oidc/aws"

  for_each = gitlab_project.this

  create_oidc_provider = false

  role_name                 = "${each.value.name}-role"
  repositories              = ["project_path:${each.value.path_with_namespace}:ref_type:branch:ref:*"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  oidc_provider_url         = "gitlab.com"
  oidc_provider_arn         = var.OIDC_PROVIDER_ARN
}
