resource_groups = {
  rg1 = {
    name     = "cmaz-o29nc6fz-mod5-rg-01"
    location = "eastus"
  },
  rg2 = {
    name     = "cmaz-o29nc6fz-mod5-rg-02"
    location = "westus2"
  },
  rg3 = {
    name     = "cmaz-o29nc6fz-mod5-rg-03"
    location = "centralus"
  }
}

tags = {
  Creator = "hari_om1@epam.com"
}

app_service_plan = {
  plan1 = {
    name     = "cmaz-o29nc6fz-mod5-asp-01"
    rg_name  = "cmaz-o29nc6fz-mod5-rg-01"
    location = "eastus"
    sku_tier = "PremiumV3"
    sku_size = "P0v3"
    capacity = 2
    os_type  = "Windows"
  },
  plan2 = {
    name     = "cmaz-o29nc6fz-mod5-asp-02"
    rg_name  = "cmaz-o29nc6fz-mod5-rg-02"
    location = "westus2"
    sku_size = "P1v3"
    sku_tier = "PremiumV3"
    capacity = 1
    os_type  = "Windows"
  }
}

web_apps = {
  app1 = {
    name                          = "cmaz-o29nc6fz-mod5-app-01"
    rg_name                       = "cmaz-o29nc6fz-mod5-rg-01"
    service_plan_key              = "plan1"
    location                      = "eastus"
    ip_restriction_default_action = "Deny"
    ip_restrictions = [
      {
        name        = "allow-ip"
        priority    = 100
        action      = "Allow"
        ip_address  = "18.153.146.156/32"
        service_tag = null
      },
      {
        name        = "allow-tm"
        priority    = 200
        action      = "Allow"
        ip_address  = null
        service_tag = "AzureTrafficManager"
      }
    ]
  },
  app2 = {
    name                          = "cmaz-o29nc6fz-mod5-app-02"
    rg_name                       = "cmaz-o29nc6fz-mod5-rg-02"
    location                      = "westus2"
    service_plan_key              = "plan2"
    ip_restriction_default_action = "Deny"
    ip_restrictions = [
      {
        name        = "allow-ip"
        priority    = 100
        action      = "Allow"
        ip_address  = "18.153.146.156/32"
        service_tag = null
      },
      {
        name        = "allow-tm"
        priority    = 200
        action      = "Allow"
        ip_address  = null
        service_tag = "AzureTrafficManager"
      }
    ]
  }
}

traffic_manager = {
  profile_name   = "cmaz-o29nc6fz-mod5-traf"
  rg_name        = "cmaz-o29nc6fz-mod5-rg-03"
  routing_method = "Performance"
  dns_name       = "cmaz-o29nc6fz-mod5-traf"
  endpoints = {
    app1 = {
      name     = "app1-endpoint"
      target   = "cmaz-o29nc6fz-mod5-app-01.azurewebsites.net"
      location = "eastus"
    }
    app2 = {
      name     = "app2-endpoint"
      target   = "cmaz-o29nc6fz-mod5-app-02.azurewebsites.net"
      location = "westus2"
    }
  }
}