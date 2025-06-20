variable "name" {
  description = "Name of the Windows Web App"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the Web App"
  type        = string
}

variable "service_plan_id" {
  description = "ID of the App Service Plan to use"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Web App"
  type        = map(string)

}

variable "ip_restrictions" {
  description = "List of IP restriction rules for the web app"
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}