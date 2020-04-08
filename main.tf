terraform {
  required_version = ">= 0.12"
}

locals {
  overrride = {
    Application       = var.application != "" ? var.application : join("", [lookup(var.tags, "application", ""), lookup(var.tags, "Application", "")]),
    AZ                = var.az != "" ? var.az : join("", [lookup(var.tags, "az", ""), lookup(var.tags, "AZ", "")]),
    Cluster           = var.cluster != "" ? var.cluster : join("", [lookup(var.tags, "cluster", ""), lookup(var.tags, "Cluster", "")]),
    Component         = var.component != "" ? var.component : join("", [lookup(var.tags, "component", ""), lookup(var.tags, "Component", "")]),
    Contact           = var.contact != "" ? var.contact : join("", [lookup(var.tags, "contact", ""), lookup(var.tags, "Contact", "")]),
    Critical          = var.critical != "" ? var.critical : join("", [lookup(var.tags, "critical", ""), lookup(var.tags, "Critical", "")]),
    Default           = var.default != "" ? var.default : join("", [lookup(var.tags, "default", ""), lookup(var.tags, "Default", "")]),
    Description       = var.description != "" ? var.description : join("", [lookup(var.tags, "description", ""), lookup(var.tags, "Description", "")]),
    Domain            = var.domain != "" ? var.domain : join("", [lookup(var.tags, "domain", ""), lookup(var.tags, "Domain", "")]),
    Endpoint          = var.endpoint != "" ? var.endpoint : join("", [lookup(var.tags, "endpoint", ""), lookup(var.tags, "Endpoint", "")]),
    Environment       = var.environment != "" ? var.environment : join("", [lookup(var.tags, "environment", ""), lookup(var.tags, "Environment", "")]),
    Group             = var.group != "" ? var.group : join("", [lookup(var.tags, "group", ""), lookup(var.tags, "Group", "")])
    KubernetesCluster = var.kubernetes_cluster != "" ? var.kubernetes_cluster : join("", [lookup(var.tags, "kubernetes_cluster", ""), lookup(var.tags, "KubernetesCluster", "")]),
    ManagedBy         = var.managed_by != "" ? var.managed_by : join("", [lookup(var.tags, "managed_by", ""), lookup(var.tags, "ManagedBy", "")]),
    Module            = var.module != "" ? var.module : join("", [lookup(var.tags, "module", ""), lookup(var.tags, "Module", "")]),
    Name              = var.name != "" ? var.name : join("", [lookup(var.tags, "name", ""), lookup(var.tags, "Name", "")]),
    Owner             = var.owner != "" ? var.owner : join("", [lookup(var.tags, "owner", ""), lookup(var.tags, "Owner", "")]),
    Private           = var.private != "" ? var.private : join("", [lookup(var.tags, "private", ""), lookup(var.tags, "Private", "")]),
    Production        = var.production != "" ? var.production : join("", [lookup(var.tags, "production", ""), lookup(var.tags, "Production", "")]),
    Profile           = var.profile != "" ? var.profile : join("", [lookup(var.tags, "profile", ""), lookup(var.tags, "Profile", "")]),
    Public            = var.public != "" ? var.public : join("", [lookup(var.tags, "public", ""), lookup(var.tags, "Public", "")]),
    Release           = var.release != "" ? var.release : join("", [lookup(var.tags, "release", ""), lookup(var.tags, "Release", "")]),
    Role              = var.role != "" ? var.role : join("", [lookup(var.tags, "role", ""), lookup(var.tags, "Role", "")]),
    Service           = var.service != "" ? var.service : join("", [lookup(var.tags, "service", ""), lookup(var.tags, "Service", "")]),
    Template          = var.template != "" ? var.template : join("", [lookup(var.tags, "template", ""), lookup(var.tags, "Template", "")]),
    Terraform         = var.terraform != "" ? var.terraform : join("", [lookup(var.tags, "terraform", ""), lookup(var.tags, "Terraform", "")]),
    Testing           = var.testing != "" ? var.testing : join("", [lookup(var.tags, "testing", ""), lookup(var.tags, "Testing", "")]),
    Tier              = var.tier != "" ? var.tier : join("", [lookup(var.tags, "tier", ""), lookup(var.tags, "Tier", "")]),
    Type              = var.type != "" ? var.type : join("", [lookup(var.tags, "type", ""), lookup(var.tags, "Type", "")]),
    Version           = var._version != "" ? var._version : join("", [lookup(var.tags, "version", ""), lookup(var.tags, "Version", "")]),

    # Append your own tag with: `make tag name=my_custom_tag_name`
  }

  tags = { for n, v in merge(var.tags, local.overrride) : n => v if v != "" }
}
