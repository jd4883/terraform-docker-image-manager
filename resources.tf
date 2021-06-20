resource "docker_image" "image" {
  name          = data.docker_registry_image.image.name
  force_remove  = var.force_remove
  keep_locally  = var.keep_locally
  dynamic "build" {
    for_each = var.build
    # TODO: this segment can be better done without try
    content {
      build_arg = try(build.value.build_arg, {})
      dockerfile = try(build.value.dockerfile, "Dockerfile")
      force_remove = try(build.value.force_remove, true)
      label = try(build.value.label, {})
      no_cache = try(build.value.no_cache, true)
      remove = try(build.value.remove, true)
      tag = try(build.value.tag, [])
      target = try(build.value.target, [])
    }
  }
  build         = var.build
  pull_triggers = [data.docker_registry_image.image.sha256_digest]
}