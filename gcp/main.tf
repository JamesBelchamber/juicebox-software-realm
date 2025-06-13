provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_service_account" "service_account" {
  account_id   = "jb-sw-realms-${random_string.suffix.id}"
  display_name = "Juicebox Software Realms (${random_string.suffix.id})"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}
