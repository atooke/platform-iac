# Output the merged tags to verify the result
output "merged_tags" {
  value = local.merged_tags
}

# Output the resource group name to verify the result
output "resource_group_name" {
  value = module.resource_group.name
}
