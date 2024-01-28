module "gitlab-oidc" {
  source = "ganexcloud/gitlab-oidc/aws"

  role_name                 = "${var.service}-role"
  url                       = var.url
  aud_value                 = [var.url]
  repositories              = ["project_path:${gitlab_project.this.path_with_namespace}:ref_type:branch:ref:*"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

resource "aws_iam_role" "this" {
  name = "AppRunnerECRAccessRole"

  path = "/service-role/"

  description = "This role gives App Runner permission to access ECR"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "build.apprunner.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"]
}
