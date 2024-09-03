terraform{

#sets the provider during the initialisation  
  required_providers{
    docker={
     
      source  = "kreuzwerker/docker"
      version = "~>3.0.1" 
    }
  }
}

provider "docker" {}


# resources image in docker 
resource "docker_image" "nginx"{
   ## pulls the image from the Container registry docker hub
   name         = "nginx"
## does'nt keep the local cache
   keep_locally = false
  
}

# creating the docker container
resource "docker_container" "nginxCon" {
  image = docker_image.nginx.image_id
  name  = "nginx_con"

  ports {
    internal = 80 # docker container
    external = 8000 # port to be mapped from the host
  }
}
