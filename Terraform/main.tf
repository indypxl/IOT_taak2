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
  name         = "ghcr.io/indypxl/IOT_taak2/iottask2_docker_image:sha-e84ca8c"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "iot_taak_2"
  must_run = false
  ports {
    internal = 80
    external = 8000
  }
}
