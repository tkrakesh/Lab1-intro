# Create a network and subnetwork
resource "google_compute_network" "network" {
  name = "my-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "my-subnetwork"
  network       = google_compute_network.network.id
  ip_cidr_range = "10.0.0.0/24"

  # ...
}
