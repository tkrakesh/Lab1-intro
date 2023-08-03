terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = "terraform-gcp-394718"
  region  = "us-central1"
  zone    = "us-central1-a"
  #credentials = file("c:\\terraform-cred\\key.json")
  #credentials = "${var.google_credentials}"
}



