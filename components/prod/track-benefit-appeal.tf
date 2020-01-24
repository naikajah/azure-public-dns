module "track-benefit-appeal" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.track-benefit-appeal-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.track-benefit-appeal-config.content).ns
  zone_name           = azurerm_dns_zone.track-benefit-appeal.name
  resource_group_name = data.azurerm_resource_group.main.name
}