terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "simplegoservice"{
  name = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true
}

resource "docker_container" "simplegoserviceTest"{
  image = docker_image.simplegoservice.image_id
  name = var.container_name
  ports{
    internal = var.internal_port
    external = var.external_port
  }
}

