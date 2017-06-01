provider "google" {
  credentials = ""
  project      = "potato-169306"
  region       = "europe-west1"
}

resource "google_container_cluster" "default" {
	name = "potato"
	zone = "europe-west1-c"
	initial_node_count = 1
	additional_zones = [
		"europe-west1-d"
	]

master_auth {
  username = "fred"
  password = "george"
}

node_config {
	machine_type = "n1-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
