terraform {
  backend "gcs" {
    prefix = "tfstate"
    credentials = "cred.json"
  }
}
