# Resource Group
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# Location
variable "location" {
  description = "Azure Region"
  type        = string
  default     = "eastus" # Change to your preferred Azure region
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

# Subnet
variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

# Public IP
variable "public_ip_name" {
  description = "Name of the Public IP address"
  type        = string
}

variable "dns_name_label" {
  description = "DNS label for the Public IP"
  type        = string
}

# Network Security Group
variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

# NSG Rules
variable "nsg_rule_http" {
  description = "Name of the NSG rule to allow HTTP"
  type        = string
}

variable "nsg_rule_ssh" {
  description = "Name of the NSG rule to allow SSH"
  type        = string
}

# Network Interface
variable "nic_name" {
  description = "Name of the Network Interface Card"
  type        = string
}

# Virtual Machine
variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "terraformadmin"
}

variable "vm_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "VM SKU size"
  type        = string
  default     = "Standard_F2s_v2"
}

# Common tags
variable "tags" {
  description = "Tags for resources"
  type        = map(any)
  default = {
    Creator = "hari_om1@epam.com"
  }


}

variable "ip_configuration_name" {
  description = "Ip configuration name"
  type        = string
  default     = "internal"
}
