resource "google_storage_bucket" "function_bucket" {
  name                        = "${var.project_id}-gcf-source"
  location                    = var.region
  uniform_bucket_level_access = true

	lifecycle {
    prevent_destroy = true
    ignore_changes = [name]
  }
}

data "archive_file" "function_code" {
  type        = "zip"
  source_dir  = "../cf_test_wom"
  output_path = "/cf_test_wom/main.zip"
}

resource "google_storage_bucket_object" "source_code" {
  name = "../cf_test_wom/main.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "../cf_test_wom/main.zip"
}

resource "google_cloudfunctions2_function" "function" {
  name        = var.cf_name
  location    = var.region
  description = "A Python Cloud Function deployed with Terraform"

  build_config {
	runtime     = "python311"
	entry_point = "hello_get"

	source {
	  storage_source {
		bucket = google_storage_bucket.function_bucket.name
		object = "cf_test_wom/main.zip"
	  }
	}
  }

  service_config {
	available_memory   = "256M"
	timeout_seconds    = 60
  }
}