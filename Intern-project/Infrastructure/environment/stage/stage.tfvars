stage_prefix = "stage-om"

location = "Central India"

# Keyvault variables
kv_sku = "standard"

# SQL variables
sql_sku                  = "S2"
sql_admin_username       = "Om"
sql_fw_rule              = "Allow-my-IP"
sql_start_ip             = "203.170.48.2"
sql_end_ip               = "203.170.48.2"
sql_admin_secretname     = "SQL-USER"
sql_admin_secretpassword = "SQL-PASSWORD"

# app and asp variables
asp_sku          = "P0v3"
app_node_version = "20-lts"

# ACR variables
acr_sku = "Basic"

#AKS variables
aks_node_pool  = "om"
aks_node_count = 1
aks_vm_size    = "Standard_D2ads_v5"