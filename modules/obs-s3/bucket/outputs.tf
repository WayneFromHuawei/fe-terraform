output "id" {
  description = "id of created bucket"
  value       = ["${orangecloud_s3_bucket.bucket_1.id}"]
}
