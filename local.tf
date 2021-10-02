  locals {
  tagged_name = join(":", [var.image, var.tag])
}