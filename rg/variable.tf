variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default = "Homework-2_RG"
}

variable "rg_location" {
  description = "The region in which the resources will be deployed"
  type        = string
  default = "east us"
}