terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
}

variable "team_tags" {
  description = "Team-specific tags"
  type = map(string)
}

variable "ds_ad_group" {
  description = "AD group for the team"
  type        = string
}

variable "ds_ad_admin_group" {
  description = "AD admin group for the team"
  type        = string
}

# Include the default tags from common/tags.tf
module "tags" {
  source = "./common"
}

# Merge the default tags and team-specific tags
locals {
  merged_tags = merge(module.tags.default_tags, var.team_tags)
}

# Extract values for the resource group name
locals {
  bus_unit     = lookup(var.team_tags, "bus_unit", "default-bus-unit")
  team         = lookup(var.team_tags, "team", "default-team")
  project_name = lookup(var.team_tags, "project_name", "default-project")
}

# Example usage of the merged tags in a resource group module
module "resource_group" {
  source  = "./modules/resource_group"
  name    = "rg-mlops-${local.bus_unit}-${local.team}-${local.project_name}"
  tags    = local.merged_tags
}



