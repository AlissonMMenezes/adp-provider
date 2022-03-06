data "azurerm_client_config" "current" {}

locals {
  resource_group_name  = "adp-c-${var.environment}-${var.project_name}"
  storage_account_name = "adpc${var.environment}${var.project_name}sa"
  key_vault_name       = "adp-c-${var.environment}-${var.project_name}-kv"
  data_factory_name    = "adp-c-${var.environment}-${var.project_name}-df"
  tenant_id            = "8abcf116-35fa-47ac-90ff-0d9db900a1a4"
}

module "terraform-resourcegroups" {
  resource_group_name = local.resource_group_name
  source              = "git::https://github.com/AlissonMMenezes/terraform-resourcegroups?ref=main"
}

module "terraform-storageaccount" {
  storage_account_name = local.storage_account_name
  resource_group_name  = local.resource_group_name
  containers           = var.containers
  source               = "git::https://github.com/AlissonMMenezes/terraform-storageaccount?ref=main"
  depends_on = [
    module.terraform-resourcegroups
  ]
}

# module "terraform-keyvault" {
#   key_vault_name      = local.key_vault_name
#   resource_group_name = local.resource_group_name
#   tenant_id           = local.tenant_id
#   source              = "git::https://github.com/AlissonMMenezes/terraform-keyvault?ref=main"
#   depends_on = [
#     module.terraform-resourcegroups
#   ]
# }

# module "terraform-datafactory" {
#   data_factory_name    = local.data_factory_name
#   key_vault_name       = local.key_vault_name
#   storage_account_name = local.storage_account_name
#   resource_group_name  = local.resource_group_name
#   source               = "git::https://github.com/AlissonMMenezes/terraform-datafactory?ref=main"
#   depends_on = [
#     module.terraform-storageaccount,
#     module.terraform-keyvault
#   ]
# }

# module "terraform-roles-assignment" {
#   data_factory_name    = local.data_factory_name
#   key_vault_name       = local.key_vault_name
#   storage_account_name = local.storage_account_name
#   resource_group_name  = local.resource_group_name
#   source               = "git::https://github.com/AlissonMMenezes/terraform-roles-assignment?ref=main"
#   depends_on = [
#     module.terraform-datafactory,
#     module.terraform-storageaccount,
#     module.terraform-keyvault
#   ]
# }
