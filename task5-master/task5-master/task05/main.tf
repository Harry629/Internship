module "resource_groups" {


  for_each = var.resource_groups

  source   = "./modules/resource_group"
  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "app_service_plan" {


  for_each = var.app_service_plan

  source   = "./modules/app_service_plan"
  name     = each.value.name
  rg_name  = each.value.rg_name
  location = each.value.location
  sku_tier = each.value.sku_tier
  sku_size = each.value.sku_size
  capacity = each.value.capacity
  tags     = var.tags

  depends_on = [
    module.resource_groups["rg1"],
  module.resource_groups["rg2"], ]
}

module "web_app" {


  for_each = var.web_apps

  source          = "./modules/app_service"
  name            = each.value.name
  rg_name         = each.value.rg_name
  location        = each.value.location
  service_plan_id = module.app_service_plan[each.value.service_plan_key].id
  tags            = var.tags
  ip_restrictions = each.value.ip_restrictions

}

locals {
  tm_endpoints = {
    for key, wa in module.web_app : key => {
      name               = wa.web_app_name
      target_resource_id = wa.id
      endpoint_location  = wa.location
    }
  }
}

module "traffic_manager" {
  source             = "./modules/traffic_manager"
  profile_name       = var.traffic_manager.profile_name
  traffic_manager_rg = var.traffic_manager.rg_name
  dns_name           = var.traffic_manager.dns_name
  routing_method     = var.traffic_manager.routing_method
  endpoints          = local.tm_endpoints
  tags               = var.tags

  depends_on = [
  module.resource_groups["rg3"]]
}