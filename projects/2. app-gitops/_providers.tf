terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.5.0"
    }
  }
}

provider "gitlab" {
  token = var.gitlab_token
}

provider "aws" {
  region = "ap-northeast-2"
}
