terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "complete_cicd_image" {
  name         = "complete-cicd:latest"
  keep_locally = false
}

resource "docker_container" "complete_cicd_container" {
  name  = "complete-cicd-v2"
  image = docker_image.complete_cicd_image.image_id
  ports {
    internal = 5050
    external = 5052
  }
  remove_volumes = true
  restart        = "no"
}
