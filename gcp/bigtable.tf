resource "google_bigtable_instance" "instance" {
  name         = "jb-sw-realms"
  display_name = "Juicebox Software Realms"

  cluster {
    cluster_id = "jb-sw-realms-cluster"
    zone       = "${var.region}-${var.zone}"
    autoscaling_config {
      min_nodes  = 1
      max_nodes  = 5
      cpu_target = 80
    }
  }
}

resource "google_bigtable_instance_iam_binding" "access" {
  instance = google_bigtable_instance.instance.name
  role     = "roles/bigtable.admin"

  members = [
    "serviceAccount:${google_service_account.service_account.email}"
  ]
}
