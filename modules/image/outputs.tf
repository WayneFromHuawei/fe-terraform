output "id" {
    description = "id of the created image"
    value       = "${openstack_images_image_v2.image.id}"
}