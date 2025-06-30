terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "complete_cicd_image" {
  name = "complete-cicd:latest"
}

resource "docker_container" "complete_cicd_container" {
  name  = "complete-cicd-v2" # Updated name to avoid conflict
  image = docker_image.complete_cicd_image.image_id

  ports {
    internal = 5050
    external = 5052 # ✅ Changed external port from 5051 to 5052
    ip       = "0.0.0.0"
    protocol = "tcp"
  }

  must_run       = true
  restart        = "no"
  start          = true
  remove_volumes = true
}
