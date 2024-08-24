#! /bin/bash
# Run upgrade and update
sudo yum upgrade -y && yum update -y

# Install Jenkins Repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo amazon-linux-extras install epel -y

# Install Java
sudo amazon-linux-extras install java-openjdk11 -y

# Install Jenkins and Start
sudo yum install jenkins -y
sudo service jenkins start

