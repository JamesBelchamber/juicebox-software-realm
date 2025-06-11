provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
}

resource "google_project_service" "secrets_manager" {
  project = var.project_id
  service = "secretmanager.googleapis.com"
}

resource "google_project_service" "pub_sub" {
  project = var.project_id
  service = "pubsub.googleapis.com"
}

resource "google_service_account" "service_account" {
  account_id   = "jb-sw-realms-${random_id.suffix.id}"
  display_name = "Juicebox Software Realms (${random_id.suffix.id})"
}

resource "random_id" "suffix" {
  byte_length = 8
}
