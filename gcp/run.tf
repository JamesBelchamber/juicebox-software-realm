# Create Cloud Run Service
resource "google_cloud_run_v2_service" "juicebox" {
  name                = "juicebox-${random_pet.suffix.id}"
  location            = var.region
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"
  scaling {
    min_instance_count = 4
  }
  template {
    timeout         = 300
    service_account = google_service_account.service_account.id
    volumes {
      name = "otel-config"
      secret {
        secret       = google_secret_manager_secret.opentelemetry_configuration.secret_id
        default_mode = "0600"
        items {
          version = "latest"
          path    = "configuration.yaml"
        }
      }
    }
    containers {
      name = "jb-sw-realms"
      ports {
        name           = "http1"
        container_port = 8080
      }
      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
      startup_probe {
        timeout_seconds   = 240
        period_seconds    = 240
        failure_threshold = 1
        tcp_socket {
          port = 8080
        }
      }
      image = "${var.juicebox_image_url}:${var.juicebox_image_version}"
      env {
        name  = "BIGTABLE_INSTANCE_ID"
        value = google_bigtable_instance.instance.id
      }
      env {
        name  = "GCP_PROJECT_ID"
        value = var.project_id
      }
      env {
        name  = "PROVIDER"
        value = "gcp"
      }
      env {
        name  = "REALM_ID"
        value = var.realm_id
      }
      dynamic "env" {
        for_each = var.juicebox_vars
        content {
          name  = each.key
          value = each.value
        }
      }
    }
    containers {
      name = "otel-collector"
      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
      startup_probe {
        timeout_seconds   = 240
        period_seconds    = 240
        failure_threshold = 1
        grpc {
          port = 4317
        }
      }
      image = "${var.otelcol_image_url}:${var.otelcol_image_version}"
      volume_mounts {
        name       = "otel-config"
        mount_path = "/otel-collector"
      }
      dynamic "env" {
        for_each = var.otelcol_vars
        content {
          name  = each.key
          value = each.value
        }
      }
    }
  }
}

resource "google_project_iam_binding" "logs_writer_binding" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  members = [
    "serviceAccount:${google_service_account.service_account.email}"
  ]
}
