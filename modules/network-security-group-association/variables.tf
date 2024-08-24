variable "subnets_id" {
  description = "A list of subnet IDs to be associated with the Network Security Group. Each ID corresponds to a subnet that will have the NSG applied."
  type = list(string)
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group that will be associated with the specified subnets. Modifying this value will trigger the creation of a new association resource."
  type = string
}
