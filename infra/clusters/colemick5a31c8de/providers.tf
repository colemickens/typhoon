provider "google" {
  credentials = "${file("~/.credentials/gcp.json")}"
  project     = "cookie-monster-america"
  region      = "us-west1"
}