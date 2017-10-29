resource "google_compute_instance" "app" {
  name         = "hadoop-${var.name}"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["hadoop-${var.role}"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }

  metadata {
    sshKeys = "deploy:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    user        = "deploy"
    agent       = false
    private_key = "${file(var.provisioner_connection_key_path)}"
  }
}





