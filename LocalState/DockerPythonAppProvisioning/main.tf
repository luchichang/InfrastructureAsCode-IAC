terraform{
  required_providers{
   
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}


#pull the image

resource "docker_image" "python_app" {
   #image to pull from the container registry
   name = "dinesht0006/python-app"
   keep_locally = false
}

# Create a container
resource "docker_container" "python_app_con" {
  image = docker_image.python_app.image_id
  name  = "python_app_con"

  ports{
    
    internal = 8000
    external = 8000
  }
}
