resource "google_compute_instance" "web_server" {
  name         = "nginx-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
  EOT
}

output "nginx_url" {
  value = "http://${google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip}"
}
