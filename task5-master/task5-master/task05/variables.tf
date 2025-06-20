variable "resource_groups" {
  description = "Map of resource groups"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plan" {
  description = "Map of app service plans"
  type = map(object({
    name     = string
    sku_tier = string
    sku_size = string
    capacity = number
    location = string
    rg_name  = string
  }))
}

variable "web_apps" {
  description = "List of windows web apps to create"
  type = map(object({
    name             = string
    rg_name          = string
    location         = string
    service_plan_key = string
    ip_restrictions = list(object({
      name        = string
      ip_address  = optional(string)
      service_tag = optional(string)
      priority    = number
      action      = string
    }))
    ip_restriction_default_action = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager configuration"
  type = object({
    profile_name   = string
    routing_method = string
    rg_name        = string
    dns_name       = string
  })
}

variable "tags" {
  description = "values for tags"
  type        = map(string)
}