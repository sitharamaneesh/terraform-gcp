variable "project" {
  description = "The ID of the Google Cloud project"
  type        = string
}


variable "location" {
  description = "The region for the GKE cluster"
  type        = string
  
}

variable "repository_id" {
  type        = string
  description = "The ID of the repository to create."
}


variable "format" {
  type        = string
  description = "The format of the repository (e.g., DOCKER)."
}

