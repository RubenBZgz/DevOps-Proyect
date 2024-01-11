# Project variables

variable "location" {
  type        = string
  description = "Deployment location"
  default     = "West Europe"
}

variable "rsgname" {
  type        = string
  description = "Resource Group name"
  default     = "TerraformRG"
}

variable "stgactname" {
  type        = string
  description = "Storage Account name"
  default     = "storageaccountname"
}


variable "replication_type" {
  type        = string
  description = "Subscription replication type"
  default     = "GRS"
}
#terraform plan -var="stgactname=prueba"