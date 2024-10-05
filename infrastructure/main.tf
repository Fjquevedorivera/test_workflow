provider "google" {
  credentials = file("../credentials.json")
  project = var.project_id
  region  = var.region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.34.0"
    }
  }
}

resource "google_storage_bucket" "function_bucket" {
  name                        = "${var.project_id}-gcf-source"
  location                    = var.region
  uniform_bucket_level_access = true
}

resource "google_cloudfunctions2_function" "function" {
  name        = "python-function"
  location    = var.region
  description = "A Python Cloud Function deployed with Terraform"

  build_config {
    runtime     = "python311"
    entry_point = "hello_world"
    source {
      storage_source {
        bucket = google_storage_bucket.function_bucket.name
        object = "function-source.zip"
      }
    }
  }

  service_config {
    available_memory   = "256M"
    timeout_seconds    = 60
  }
}