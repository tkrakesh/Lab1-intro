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
          set -e
          echo "*****    Installing Nginx    *****"
          apt update
          apt install -y nginx
          ufw allow 'Nginx HTTP'
          systemctl enable nginx
          systemctl restart nginx
              
          echo "*****   Installation Complteted!!   *****"
              
          echo "Welcome to Google Compute VM Instance deployed using Terraform!!!" > /var/www/html/index.html
              
          echo "*****   Startup script completes!!    *****"
      EOT

}

output "nginx_url" {
  value = "http://${google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip}"
}
