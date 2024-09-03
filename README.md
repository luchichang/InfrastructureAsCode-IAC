# InfrastructureAsCode-IAC
This Repository Contains all the Infrastructure Code Created to automate the Creation , Configuration and Maintenance of Infrastructure

## Steps to install Terraform

  * update the apt Package Manager
        sudo apt update -y
  * download and sotre the GPG keyring

          wget -O- https://apt.releases.hashicorp.com/gpg | \
          gpg --dearmor | \
          sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null    

      * downloads the GPG key from hashicorp
      * converts the ASCII-Armored-key to a binary format
      * stores the key in key ring
  * Verify the GPG key fingerprint __(Optional)__ <br>
  
           gpg --no-default-keyring \
           --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
           --fingerprint
  * add the repository and signing to the /etc/apt/sources.list.d/ <br>
  
            echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
            https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
            sudo tee /etc/apt/sources.list.d/hashicorp.list
    
 * Update the Package Manager and install the terraform from the new repository <br>
 
            echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
            https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
            sudo tee /etc/apt/sources.list.d/hashicorp.list

   🥳🎉Hurrah! Terraform Package got installed. you can verify it using ``` terraform --version ```    

     
