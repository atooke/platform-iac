variable "name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type = map(string)
}

resource "azurerm_resource_group" "example" {
  name     = var.name
  location = "West US"

  tags = var.tags
}
