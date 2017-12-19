resource "orangecloud_s3_bucket" "bucket_1" {
  region = "${var.region}"
  bucket = "${var.bucket_name}"
  acl    = "${var.acl_policy}"
}

resource "orangecloud_s3_bucket_policy" "policy_1" {
  bucket = "${orangecloud_s3_bucket.bucket_1.id}"
  policy = "${var.bucket_policy}"
}
