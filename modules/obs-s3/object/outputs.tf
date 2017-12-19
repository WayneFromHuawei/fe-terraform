output "id" {
  description = "list of ids of created object"
  value       = ["${orangecloud_s3_bucket_object.object_1.id}"]
}
