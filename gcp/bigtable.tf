resource "google_bigtable_instance" "instance" {
  project      = var.project_id
  name         = "jb-sw-realms-${random_string.suffix.id}"
  display_name = "JB Software Realms (${random_string.suffix.id})"

  cluster {
    cluster_id = "jb-sw-realms-cluster-${random_string.suffix.id}"
    zone       = "${var.region}-${var.zone}"
    autoscaling_config {
      min_nodes  = 1
      max_nodes  = 5
      cpu_target = 80
    }
  }
}

resource "google_bigtable_instance_iam_binding" "access" {
  project  = var.project_id
  instance = google_bigtable_instance.instance.name
  role     = "roles/bigtable.admin"

  members = [
    "serviceAccount:${google_service_account.service_account.email}"
  ]
}
