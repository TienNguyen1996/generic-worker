#!/bin/bash

# docker installation
# https://docs.docker.com/engine/install/ubuntu/

# Update the apt package index and install packages to allow apt to use a repository over HTTPS 
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg -y

# Use the following command to set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index
sudo apt-get update -y

# To install the latest version, run
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#Add your user to the docker group
sudo usermod -aG docker ubuntu
newgrp docker
