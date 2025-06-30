provider "docker" {}

resource "docker_image" "complete_cicd_image" {
  name         = "complete-cicd"
  build {
    context    = ".."
    dockerfile = "../Dockerfile"
  }
}

resource "docker_container" "complete_cicd_container" {
  name  = "complete-cicd"
  image = docker_image.complete_cicd_image.latest

  ports {
    internal = 5000
    external = 5000
  }
}
