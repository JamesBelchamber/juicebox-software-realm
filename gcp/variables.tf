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
}

variable "juicebox_vars" {
  description = "Environment variables for the juicebox container"
  type        = map(string)
  default     = {}
}

variable "otelcol_image_url" {
  description = "The url of the opentelemetry collector docker image"
  type        = string
}

variable "otelcol_image_version" {
  description = "The version of the opentelemetry collector docker image"
  type        = string
}

variable "otelcol_config_b64" {
  description = "A configuration file for the OpenTelemetry Collector, encoded in base64"
  type        = string
  default     = "cmVjZWl2ZXJzOgogIG90bHA6CiAgICBwcm90b2NvbHM6CiAgICAgIGdycGM6CiAgICAgICAgZW5kcG9pbnQ6IGxvY2FsaG9zdDo0MzE3CiAgaG9zdG1ldHJpY3M6CiAgICBjb2xsZWN0aW9uX2ludGVydmFsOiAxMHMKICAgIHNjcmFwZXJzOgogICAgICBwYWdpbmc6CiAgICAgICAgbWV0cmljczoKICAgICAgICAgIHN5c3RlbS5wYWdpbmcudXRpbGl6YXRpb246CiAgICAgICAgICAgIGVuYWJsZWQ6IHRydWUKICAgICAgY3B1OgogICAgICAgIG1ldHJpY3M6CiAgICAgICAgICBzeXN0ZW0uY3B1LnV0aWxpemF0aW9uOgogICAgICAgICAgICBlbmFibGVkOiB0cnVlCiAgICAgIGRpc2s6CiAgICAgIGZpbGVzeXN0ZW06CiAgICAgICAgbWV0cmljczoKICAgICAgICAgIHN5c3RlbS5maWxlc3lzdGVtLnV0aWxpemF0aW9uOgogICAgICAgICAgICBlbmFibGVkOiB0cnVlCiAgICAgIGxvYWQ6CiAgICAgIG1lbW9yeToKICAgICAgbmV0d29yazoKICAgICAgcHJvY2Vzc2VzOgoKcHJvY2Vzc29yczoKICBiYXRjaDoKICAgIHNlbmRfYmF0Y2hfbWF4X3NpemU6IDEwMAogICAgc2VuZF9iYXRjaF9zaXplOiAxMAogICAgdGltZW91dDogMTBzCiAgYXR0cmlidXRlcy9kZDoKICAgIGFjdGlvbnM6CiAgICAgIC0ga2V5OiBlbnYKICAgICAgICBhY3Rpb246IGluc2VydAogICAgICAgIHZhbHVlOiAke2VudjpERF9FTlZfTkFNRX0KCmV4cG9ydGVyczoKICBkYXRhZG9nOgogICAgYXBpOgogICAgICBzaXRlOiAke2VudjpERF9TSVRFfQogICAgICBrZXk6ICR7ZW52OkREX0FQSV9LRVl9CiAgICBob3N0X21ldGFkYXRhOgogICAgICB0YWdzOgogICAgICAgIC0gcmVhbG06JHtlbnY6UkVBTE1fSUR9CgpzZXJ2aWNlOgogIHBpcGVsaW5lczoKICAgIG1ldHJpY3M6CiAgICAgIHJlY2VpdmVyczogW2hvc3RtZXRyaWNzLCBvdGxwXQogICAgICBwcm9jZXNzb3JzOiBbYXR0cmlidXRlcy9kZCxiYXRjaF0KICAgICAgZXhwb3J0ZXJzOiBbZGF0YWRvZ10KICAgIHRyYWNlczoKICAgICAgcmVjZWl2ZXJzOiBbb3RscF0KICAgICAgcHJvY2Vzc29yczogW2F0dHJpYnV0ZXMvZGQsYmF0Y2hdCiAgICAgIGV4cG9ydGVyczogW2RhdGFkb2ddCiAgICBsb2dzOgogICAgICByZWNlaXZlcnM6IFtvdGxwXQogICAgICBwcm9jZXNzb3JzOiBbYXR0cmlidXRlcy9kZCxiYXRjaF0KICAgICAgZXhwb3J0ZXJzOiBbZGF0YWRvZ10K"
  # This is a base64 representation of ../otel-collector-config.yaml
}

variable "otelcol_vars" {
  description = "Environment variables for the juicebox container"
  type        = map(string)
  default     = {}
}
