data "local_file" "platform-hmcts-config" {
  filename = "${path.cwd}/../../environments/prod/platform-hmcts-net.yml"
}

module "platform-hmcts" {
  source              = "../../modules/azure-public-dns/"
  cname_records       = yamldecode(data.local_file.platform-hmcts-config.content).cname
  ns_recordsets       = yamldecode(data.local_file.platform-hmcts-config.content).ns
  a_recordsets        = yamldecode(data.local_file.platform-hmcts-config.content).A
  txt_recordsets      = yamldecode(data.local_file.platform-hmcts-config.content).txt
  mx_recordsets       = yamldecode(data.local_file.platform-hmcts-config.content).mx
  zone_name           = "platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = var.env
}
