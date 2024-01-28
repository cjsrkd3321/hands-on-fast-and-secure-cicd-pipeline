terraform {
  backend "s3" {
    bucket = "hands-on-cicd-pipeline-20240114021410844200000001"
    key    = "terraform.tfstate"
    region = "ap-northeast-2"
  }
}
