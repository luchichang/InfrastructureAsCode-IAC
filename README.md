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
     
