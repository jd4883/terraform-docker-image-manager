resource "docker_image" "image" {
  name         = data.docker_registry_image.image.name
  force_remove = var.force_remove
  keep_locally = var.keep_locally
  dynamic "build" {
    for_each = var.build
    content {
      build_arg    = lookup(build.value, "build_arg", {})
      dockerfile   = lookup(build.value, "dockerfile", "Dockerfile")
      force_remove = lookup(build.value, "force_remove", true)
      label        = lookup(build.value, "label", {})
      no_cache     = lookup(build.value, "no_cache", true)
      path         = lookup(build.value, "path", ".")
      remove       = lookup(build.value, "remove", true)
      tag          = lookup(build.value, "tag", [])
      target       = lookup(build.value, "target", [])
    }
  }
  pull_triggers = [data.docker_registry_image.image.sha256_digest]
}
