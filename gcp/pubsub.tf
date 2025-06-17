# Define a custom role with the specific pub/sub perms needed.
resource "google_project_iam_custom_role" "pubsub_role" {
  role_id     = "pubsub_role"
  title       = "Role for managing pub/sub from a software realm"
  description = "Role for managing pub/sub from a software realm"
  permissions = ["pubsub.subscriptions.create",
    "pubsub.topics.attachSubscription",
    "pubsub.topics.create",
    "pubsub.topics.publish",
    "pubsub.subscriptions.consume",
  ]
}

# Grant pub/sub access to the service account
resource "google_project_iam_binding" "pubsub_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.pubsub_role.name
  members = [
    "serviceAccount:${google_service_account.service_account.email}"
  ]
}
