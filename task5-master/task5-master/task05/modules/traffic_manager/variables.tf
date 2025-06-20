variable "profile_name" {
  description = "Name of the Traffic Manager profile"
  type        = string
}

variable "traffic_manager_rg" {
  description = "Resource group for Traffic Manager"
  type        = string
}

variable "dns_name" {
  description = "Relative DNS name for Traffic Manager (will form <dns_name>.trafficmanager.net)"
  type        = string
}

variable "routing_method" {
  description = "Traffic routing method (e.g., Performance, Priority)"
  type        = string
}

variable "endpoints" {
  description = "Map of endpoints to add to the Traffic Manager profile"
  type = map(object({
    name               = string
    target_resource_id = string
    endpoint_location  = string
  }))
}



variable "tags" {
  description = "Tags to apply to the Traffic Manager profile"
  type        = map(string)

}