variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "realm_id" {
  description = "A 16-byte hex string that identifies your realm"
  type        = string
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
}

variable "zone" {
  description = "Google Cloud Zone"
  type        = string
}

variable "tenant_secrets" {
  description = "The names of any tenants you will be allowing access to (alphanumeric) mapped to their auth signing key. Read the 'Tenant Auth Secrets' section of the README for more details."
  type        = map(string)
}

variable "juicebox_image_url" {
  description = "The url of the juicebox docker image"
  type        = string
}

variable "juicebox_image_version" {
  description = "The version of the juicebox docker image"
  type        = string
  default     = "latest"
}

variable "otelcol_image_url" {
  description = "The url of the opentelemetry collector docker image"
  type        = string
  default     = "ghcr.io/open-telemetry/opentelemetry-collector-releases/opentelemetry-collector-otlp"
}

variable "otelcol_image_version" {
  description = "The version of the opentelemetry collector docker image"
  type        = string
  default     = "latest"
}

variable "otelhttp_metrics_endpoint" {
  description = "The endpoint for shipping OpenTelemetry Metrics over HTTP"
  type        = string
}

variable "otelhttp_logs_endpoint" {
  description = "The endpoint for shipping OpenTelemetry Logs over HTTP"
  type        = string
}

variable "otelhttp_traces_endpoint" {
  description = "The endpoint for shipping OpenTelemetry Traces over HTTP"
  type        = string
}
