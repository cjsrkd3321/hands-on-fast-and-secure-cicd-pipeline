resource "aws_kms_key" "this" {
  deletion_window_in_days  = 7
  customer_master_key_spec = "RSA_4096"
  key_usage                = "SIGN_VERIFY"
}

resource "aws_kms_alias" "this" {
  name          = "alias/container-signing-key"
  target_key_id = aws_kms_key.this.key_id
}
