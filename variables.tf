variable "image" { type = string }
variable "build" { default = {} }

variable "keep_locally" {
  type    = bool
  default = false
}

variable "force_remove" {
  type    = bool
  default = true
}

variable "tag" {
  type    = string
  default = "latest"
}

