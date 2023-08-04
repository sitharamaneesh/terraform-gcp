variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
  default     = "nifty-altar-394805"
}


variable "region" {
  description = "The region for the GKE cluster"
  type        = string
  default     = ""
}

variable "cluster_location" {
  description = "The location for the GKE cluster"
  type        = string
  default     = ""
}
