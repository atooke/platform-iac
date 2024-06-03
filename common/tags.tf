variable "default_tags" {
  description = "Default tags"
  type = map(string)
  default = {
    core-tech-owner       = "default-tech-owner"
    core-application-name = "default-application-name"
    core-env              = "default-env"
    core-bap-number       = "default-bap-number"
    core-cost-center      = "default-cost-center"
    cost_center           = "default-cost-center"
  }
}