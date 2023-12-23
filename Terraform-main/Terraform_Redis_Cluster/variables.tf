variable "cluster_id" {
  description = "Variable contains value from Terraform.tfvars file"
  type        = string
  default     = "default-cluster-id"
}

variable "engine" {
  description = "Variable contains value from Terraform.tfvars file"
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "Variable contains value from Terraform.tfvars file"
  type        = string
  default     = "cache.m4.large"
}

variable "num_cache_nodes" {
  description = "Variable contains value from Terraform.tfvars file"
  type        = number
  default     = 1
}

variable "parameter_group_name" {
  description = "Variable contains value from Terraform.tfvars file"
  type        = string
  default     = "default.redis3.2"
}

variable "engine_version" {
  description = "Variable contains value from Terraform.tfvars file"
  type        = string
  default     = "3.2.10"
}

variable "port" {
  description = "Variable contains value from Terraform.tfvars file"
  type        = number
  default     = 6379
}
