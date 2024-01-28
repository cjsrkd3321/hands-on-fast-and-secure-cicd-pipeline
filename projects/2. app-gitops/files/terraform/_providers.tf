terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.5.0"
    }
  }
}

provider "gitlab" {
  token = var.GITLAB_TOKEN
}

provider "aws" {
  region = "ap-northeast-2"
}

provider "aws" {
  alias  = "apne1"
  region = "ap-northeast-1"
}
