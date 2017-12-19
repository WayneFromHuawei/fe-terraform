resource "orangecloud_s3_bucket_object" "object_1" {
  bucket       = "${var.bucket_id}"
  source       = "${var.object_path}"
  key          = "${var.object_key}"
  acl          = "${var.object_acl}"
  content_type = "${var.content_type}"
}
