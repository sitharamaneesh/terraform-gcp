resource "google_artifact_registry_repository" "my-repo" {
#  provider      = google-beta
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id
  format        = var.format
}
