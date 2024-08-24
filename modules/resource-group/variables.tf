variable "naming_prefix" {
  description = "A prefix used to generate resource names. This helps in maintaining consistency and organization across multiple related resources."
  type = string
}

variable "location" {
  description = "The Azure region where the resource will be deployed. This specifies the geographic location and data center where the resource will reside."
  type = string
}
