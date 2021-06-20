resource "docker_image" "image" {
  name          = data.docker_registry_image.image.name
  force_remove  = var.force_remove
  keep_locally  = var.keep_locally
  build         = var.build
  pull_triggers = [data.docker_registry_image.image.sha256_digest]
}