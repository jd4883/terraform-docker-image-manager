output "id" { value = data.docker_registry_image.image.sha256_digest }
output "name" { value = docker_image.image.name }