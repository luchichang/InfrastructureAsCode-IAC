# Description
     docker NGINX server  container creation using INFRA as a Code using Terraform.

## Steps;
  
  * Setting up the local Environment 
       
        sudo apt update && sudo apt-get install docker.io -y

     adding the docker group to the local user in order to avoid root user vulnerability <br>
    
        sudo usermod -aG docker <User Name>  
  * Initialising the backend such that terraform set up the workspace to be convert the api code to the target api. mentioned in the main.tf under **required_providers** block <br>
        
        terraform init
  * Apply the changes, when running this code a prompt describes the process terraform gonna perform to the targetted API as per our code. and asks for confirmation. type **yes** for confirmation

        terraform apply
    

  * Now the Nginx container will be running as per our code. which can be accessed from the your node's ``` Public Ip:8000```

(note: if you want to change the website execute the container and inside the **/usr/share/nginx/html/index.html** replace with your code and for port changes see **/etc/nginx/nginx.conf** path) <br>

        docker exec -it <container name> /bin/bash
      
