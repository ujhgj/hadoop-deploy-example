resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall_hadoop" {
  name        = "default-hadoop"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["50070", "8088", "50030", "8030", "8031", "8032"]
  }
}

resource "google_compute_firewall" "firewall_hive" {
  name        = "default-hive"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["10000"]
  }
}