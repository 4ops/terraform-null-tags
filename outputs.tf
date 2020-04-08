output application {
  value = lookup(local.tags, "Application", "")
}

output az {
  value = lookup(local.tags, "AZ", "")
}

output cluster {
  value = lookup(local.tags, "Cluster", "")
}

output component {
  value = lookup(local.tags, "Component", "")
}

output contact {
  value = lookup(local.tags, "Contact", "")
}

output critical {
  value = lookup(local.tags, "Critical", "")
}

output default {
  value = lookup(local.tags, "Default", "")
}

output description {
  value = lookup(local.tags, "Description", "")
}

output domain {
  value = lookup(local.tags, "Profile", "")
}

output endpoint {
  value = lookup(local.tags, "Endpoint", "")
}

output environment {
  value = lookup(local.tags, "Environment", "")
}

output group {
  value = lookup(local.tags, "Group", "")
}

output kubernetes_cluster {
  value = lookup(local.tags, "KubernetesCluster", "")
}

output managed_by {
  value = lookup(local.tags, "ManagedBy", "")
}

output module {
  value = lookup(local.tags, "Module", "")
}

output name {
  value = lookup(local.tags, "Name", "")
}

output owner {
  value = lookup(local.tags, "Owner", "")
}

output private {
  value = lookup(local.tags, "Private", "")
}

output production {
  value = lookup(local.tags, "Production", "")
}

output profile {
  value = lookup(local.tags, "Profile", "")
}

output public {
  value = lookup(local.tags, "Public", "")
}

output release {
  value = lookup(local.tags, "Release", "")
}

output role {
  value = lookup(local.tags, "Role", "")
}

output service {
  value = lookup(local.tags, "Service", "")
}

output template {
  value = lookup(local.tags, "Template", "")
}

output terraform {
  value = lookup(local.tags, "Terraform", "")
}

output testing {
  value = lookup(local.tags, "Testing", "")
}

output tier {
  value = lookup(local.tags, "Tier", "")
}

output type {
  value = lookup(local.tags, "Type", "")
}

output version {
  value = lookup(local.tags, "Version", "")
}

# Append your own tag with: `make tag name=my_custom_tag_name`

output tags {
  value = local.tags
}
