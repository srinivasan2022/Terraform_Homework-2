variable "vnet_name" {
  type = string
  default = "homework-2_vnet1"
}

variable "vnet_address_space" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}
