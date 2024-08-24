#!/bin/bash

# Run update
sudo apt update -y
        
# ==> Google: sonarqube docker image
# Select hub.docker.com/sonarqube   
# Latest version community 

# Install Docker
sudo apt install docker.io -y

# Start docker
systemctl start docker

# Enable docker
systemctl enable docker

# Run Container
sudo docker container run --name=sonarqubecontainer -p 9000:9000 --detach sonarqube:latest
