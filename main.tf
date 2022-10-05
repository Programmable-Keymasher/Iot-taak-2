terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "ghcr.io/programmable-keymasher/iot-taak-2/hallo:sha-de7b8cc"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  must_run = false
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
