variable "appservice_rg" {
  type        = string
  description = "Keyvault rg name"
}

variable "app_insights_name" {
  type = string
}

variable "app_service_planname" {
  type = string
}

variable "appservice_name" {
   type = string
}

variable "msi_id" {
  type=string
}
