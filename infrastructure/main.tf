resource "google_storage_bucket" "bucket" {
  name     = "${var.project_id}-gcf-source"  # Every bucket name must be globally unique
  location = "US"
  uniform_bucket_level_access = true
}