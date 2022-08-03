variable "tags" {
  description = "tags to associate with this instance"
  type        = map(string)
}
variable "stack_name" {
  description = "name of the project"
  type        = string
}
variable "region" {
  description = "aws region to deploy"
  type        = string
  default     = "us-east-1"
}
variable "profile" {
  description = "iam user profile to use"
  type        = string
  default     = "default"
}
variable "remote_state_bucket_name" {
  description = "name of the remote bucket to store or pull terraform state data"
  type        = string
  default     = null
}
variable "private_subnet_ids" {
  description = "list of private subnet ids to use"
  type        = list(string)
  default     = null
}
variable "public_subnet_ids" {
  description = "list of public subnet ids to use"
  type        = list(string)
  default     = null
}
variable "db_private_ip" {
  description = "private ip address to use for the database"
  type        = string
}
variable "vpc_id" {
  description = "vpc id"
  type        = string
}
variable "subnet_ip_block" {
  description = "subnet ip block"
  type        = list(string)
}
variable "alb_certificate_arn" {
  description = "alb certificate arn"
  type        = string
}
variable "domain_url" {
  description = "url to use for this stack"
  type        = string
}
variable "create_alb_s3_bucket" {
  description = "do we create alb s3 bucket"
  type        = bool
  default     = false
}
variable "alb_s3_bucket_name" {
  description = "name of bucket to use for alb logs"
  default     = ""
  type        = string
}
variable "alb_s3_prefix" {
  description = "name of prefix to use for alb logs"
  default     = ""
  type        = string
}
variable "internal_alb" {
  description = "is this alb internal?"
  default     = false
  type        = bool
}
variable "ssh_key_name" {
  description = "name of the ssh key to manage the instances"
  type        = string
}
variable "ssh_user" {
  description = "name of the ssh user"
  type        = string
}
variable "neo4j_password" {
  type        = string
  description = "neo4j password"
  sensitive   = true
}
variable "indexd_url" {
  type        = string
  description = "indexd url"
  sensitive   = true
}
variable "create_ecr_repos" {
  description = "do we create ecr repos"
  default     = false
  type        = bool
}

# Monitoring variables
variable "sumologic_access_id" {
  type        = string
  description = "Sumo Logic Access ID"
}
variable "sumologic_access_key" {
  type        = string
  description = "Sumo Logic Access Key"
  sensitive   = true
}

# Role variables - set for cloudone environments
variable "use_cbiit_iam_roles" {
  description = "use CBIIT configurations for IAM roles"
  default     = false
  type        = bool
}
variable "create_es_service_role" {
  description = "change this value to true if running this script for the first time"
  type        = bool
  default     = false
}