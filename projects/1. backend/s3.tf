resource "aws_s3_bucket" "this" {
  bucket_prefix = "hands-on-cicd-pipeline-"
  force_destroy = true
}
