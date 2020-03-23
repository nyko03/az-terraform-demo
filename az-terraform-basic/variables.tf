# general subscription vars
variable "subscription_id" {}
#variable "client_id" {}
#variable "client_secret" {}
variable "tenant_id" {}
variable "object_id" {}

# descriptive vars
variable "area" {}
variable "department" {}
variable "project" {
  type = map
}
variable "env" {}
variable "region" {
  type = map
}
variable "common_tags" {
  type = map
}