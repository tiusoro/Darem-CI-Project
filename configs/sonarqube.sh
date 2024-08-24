#!/bin/bash

# Run Update
sudo su
apt update

# Installation of Java and jre jdk
apt install openjdk-17-jdk openjdk-17-jre -y

# Installation of SonarQube
cd opt/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.5.0.89998.zip

# Unzip Sonarqube
apt install unzip -y
unzip sonarqube-10.5.0.89998.zip
rm sonarqube-10.5.0.89998.zip

# Change ownership of Sonarqube
chown ubuntu:ubuntu sonarqube-10.5.0.89998/ -R
exit

# Change ownership of Folders
cd sonarqube-10.5.0.89998/bin/linux-x86-64/

# Start sonarqube
sh sonar.sh start

