variable "LOCAL_AWS_ES_DOMAIN_NAME" {
  description = "Local OpenSearch domain name"
}

variable "REMOTE_AWS_ES_DOMAIN_NAME" {
  description = "Remote OpenSearch domain name"
}

variable "LOCAL_AWS_REGION" {
  description = "AWS region for the local OpenSearch domain"
}

variable "PATH" {
  description = "Path variable for AWS CLI execution"
}
variable "delete_indices" {
  description = "Creates intances (0 or 1 )of null resource BAsed on true/False"
}

variable "es_username" {
  description = "To execute command in null resource we need this variable in environment"
}

variable "es_password" {
  description = "To execute command in null resource we need this variable in environment"
}

