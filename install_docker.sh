#!/bin/bash

# Download and install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo rm get-docker.sh

# Add the current user to the docker group and activate changes in a subshell
sudo usermod -aG docker $USER
exec sg docker newgrp docker

# Install Docker Compose
sudo apt install docker-compose -y
