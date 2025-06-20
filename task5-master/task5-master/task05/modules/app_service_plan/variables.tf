variable "name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the App Service Plan"
  type        = string
}

variable "sku_tier" {
  description = "SKU tier of the App Service Plan (e.g., Basic, Standard)"
  type        = string
}

variable "sku_size" {
  description = "SKU size (e.g., B1, S1)"
  type        = string
}

variable "capacity" {
  description = "Instance capacity for the App Service Plan"
  type        = number
}

variable "os_type" {
  description = "OS type: Windows or Linux"
  type        = string
  default     = "Windows"
}

variable "tags" {
  description = "Tags for the App Service Plan"
  type        = map(string)
}