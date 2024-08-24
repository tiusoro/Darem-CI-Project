#!/bin/bash

# Installation of Java
sudo yum install java -y
echo 'export JAVA_HOME="/usr/lib/jvm/java-17-amazon-corretto.x86_64"' >> ~/.bash_profile		       
echo 'export PATH="$HOME/.daml/bin:$PATH"' >> ~/.bash_profile

# Install Jenkins Repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo amazon-linux-extras install epel -y

# Install Jenkins and Start
sudo yum install jenkins -y
sudo service jenkins start

# Installation of Maven
cd opt/
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xvzf apache-maven-3.9.6-bin.tar.gz
rm apache-maven-3.9.6-bin.tar.gz
echo 'export PATH="$PATH:/opt/apache-maven-3.9.6/bin"' >> ~/.bash_profile

# Cloning of github account
cd ../root/
yum install git -y
git clone https://github.com/tiusoro/springboot-maven-micro.git

#reload the bash profile
. ~/.bash_profile

