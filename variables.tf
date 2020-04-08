variable application {
  default = ""
}

variable az {
  default = ""
}

variable cluster {
  default = ""
}

variable component {
  default = ""
}

variable contact {
  default = ""
}

variable critical {
  default = ""
}

variable default {
  default = ""
}

variable description {
  default = ""
}

variable domain {
  default = ""
}

variable endpoint {
  default = ""
}

variable environment {
  default = ""
}

variable group {
  default = ""
}

variable kubernetes_cluster {
  default = ""
}

variable managed_by {
  default = ""
}

variable module {
  default = ""
}

variable name {
  default = ""
}

variable owner {
  default = ""
}

variable private {
  default = ""
}

variable production {
  default = ""
}

variable profile {
  default = ""
}

variable public {
  default = ""
}

variable release {
  default = ""
}

variable role {
  default = ""
}

variable service {
  default = ""
}

variable template {
  default = ""
}

variable terraform {
  default = ""
}

variable testing {
  default = ""
}

variable tier {
  default = ""
}

variable type {
  default = ""
}

variable _version {
  default = ""
}

# Append your own tag with: `make tag name=my_custom_tag_name`

variable tags {
  type    = map(any)
  default = {}
}
