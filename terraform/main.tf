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

# Build Docker image from local Dockerfile
resource "docker_image" "complete_cicd_image" {
  name = "complete-cicd:latest"

  build {
    context    = "${path.module}"
    dockerfile = "${path.module}/Dockerfile"
    remove     = true
  }
}

# Run a Docker container from the built image
resource "docker_container" "complete_cicd_container" {
  name  = "complete-cicd"
  image = docker_image.complete_cicd_image.image_id

  ports {
    internal = 5050
    external = 5051
    ip       = "0.0.0.0"
    protocol = "tcp"
  }

  must_run       = true
  restart        = "no"
  start          = true
  remove_volumes = true
}
