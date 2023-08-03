terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = "terraform-gcp"
  region  = "us-central1"
  zone    = "us-central1-c"
  #credentials = file("c:\\terraform-cred\\key.json")
  #credentials = "${var.google_credentials}"
}



