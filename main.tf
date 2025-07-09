module "rgroup_3837" {
  source              = "./modules/rgroup-3837"
  resource_group_name = "3837-RG"
  location            = "Canada Central"

  tags = local.tags
}

module "network_3837" {
  source              = "./modules/network-3837"
  resource_group_name = module.rgroup_3837.resource_group_name
  location            = "Canada Central"
  vnet_name           = "3837-VNET"
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "3837-SUBNET"
  subnet_prefixes     = ["10.0.1.0/24"]
  nsg_name            = "3837-NSG"

  tags = local.tags
}

module "common_3837" {
  source                = "./modules/common-3837"
  resource_group_name   = module.rgroup_3837.resource_group_name
  location              = "Canada Central"
  log_analytics_name    = "loganalytics3837"
  recovery_vault_name   = "vault3837"
  storage_account_name  = "commstorage3837"

  tags = local.tags
}

module "vmlinux_3837" {
  source                 = "./modules/vmlinux-3837"
  resource_group_name    = module.rgroup_3837.resource_group_name
  location               = "Canada Central"
  subnet_id              = module.network_3837.subnet_id
  vm_names               = ["vm1-3837", "vm2-3837", "vm3-3837"]
  dns_labels             = ["vm1dns3837", "vm2dns3837", "vm3dns3837"]
  availability_set_name  = "linux-avset-3837"
  admin_username         = "azureuser"
  admin_password         = "Password1234!"
  storage_account_uri    = module.common_3837.storage_account_uri

  tags = local.tags
}

module "vmwindows_3837" {
  source                 = "./modules/vmwindows-3837"
  resource_group_name    = module.rgroup_3837.resource_group_name
  location               = "Canada Central"
  subnet_id              = module.network_3837.subnet_id
  vm_name                = "winvm-3837"
  dns_label              = "winvm3837"
  availability_set_name  = "windows-avset-3837"
  admin_username         = "azureadmin"
  admin_password         = "Password1234!"
  storage_account_uri    = module.common_3837.storage_account_uri

  tags = local.tags
}

module "datadisk_3837" {
  source              = "./modules/datadisk-3837"
  resource_group_name = module.rgroup_3837.resource_group_name
  location            = "Canada Central"
  vm_ids = concat(
    [for vm in module.vmlinux_3837.vm_ids : vm],
    [module.vmwindows_3837.vm_id]
  )
  tags = local.tags
}

module "loadbalancer_3837" {
  source              = "./modules/loadbalancer-3837"
  resource_group_name = module.rgroup_3837.resource_group_name
  location            = "Canada Central"
  linux_nic_ids       = module.vmlinux_3837.linux_nic_ids

  tags = local.tags
}

module "database_3837" {
  source              = "./modules/database-3837"
  resource_group_name = module.rgroup_3837.resource_group_name
  location            = "Canada Central"
  db_name             = "postgresdb3837"
  admin_username      = "pgadminuser"
  admin_password      = "PostgresP@ssword123"

  tags = local.tags
}




