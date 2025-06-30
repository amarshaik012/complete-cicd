provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "complete_cicd_image" {
  name = "complete-cicd"

  build {
    context    = "."
    dockerfile = "./Dockerfile"
  }
}

resource "docker_container" "complete_cicd_container" {
  name  = "complete-cicd"
  image = docker_image.complete_cicd_image.image_id

  ports {
    internal = 5050
    external = 5050
    ip       = "0.0.0.0"
  }
}
