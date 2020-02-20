module "moneyclaims" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.moneyclaims-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.moneyclaims-config.content).ns
  zone_name           = azurerm_dns_zone.moneyclaims.name
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}