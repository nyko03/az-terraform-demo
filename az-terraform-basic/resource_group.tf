resource "azurerm_resource_group" "rg" {
  name     = "${var.project.name}-${var.env}-rg"
  location = var.region.name

  tags = var.common_tags
}