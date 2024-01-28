variable "service" {
  type    = string
  default = "aws-iam-gitops"
}

variable "url" {
  type    = string
  default = "https://gitlab.com"
}

##### DO NOT TOUCH BELOW #####
variable "GITLAB_TOKEN" {
  type        = string
  description = "이 값은 GITLAB 환경변수로 마스킹 되어 있습니다."
}

variable "OIDC_PROVIDER_ARN" {
  type = string
}

variable "KMS_KEY_ID" {
  type = string
}

variable "APP_RUNNER_SERVICE_ROLE_ARN" {
  type = string
}
