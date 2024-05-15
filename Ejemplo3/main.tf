terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
}

resource "docker_container" "api" {
  name  = "mi-api"
  image = "mi-api"
  ports {
    internal = 3000
    external = 3000
  }
}

resource "docker_container" "mysql" {
  name  = "mi-mysql"
  image = "mysql:latest"
  ports {
    internal = 3306
    external = 3306
  }
  
  env = [
    "MYSQL_ROOT_PASSWORD=password", # Cambiar esto a tu contraseña deseada
    "MYSQL_DATABASE=prueba"         # Cambiar esto al nombre de tu base de datos
  ]

  # Otros atributos del contenedor...
}

resource "docker_container" "landing_page" {
  name  = "mi-landing-page"
  image = "nginx:alpine"
  ports {
    internal = 80
    external = 8080
  }
  volumes {
    host_path      = "C:/Users/Usuario Dell/Desktop/Ejemplo3/landing_page"
    container_path = "/usr/share/nginx/html"
  }
}
