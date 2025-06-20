variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the Storage Account"
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network"
}

variable "frontend_subnet_name" {
  type        = string
  description = "The name of the frontend subnet"
}

variable "backend_subnet_name" {
  type        = string
  description = "The name of the backend subnet"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to resources"
}
