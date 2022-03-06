variable "project_name" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "containers" {
  type        = list(any)
  description = "list of containers to be created"
  default     = []
}