provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_vpc" "some_custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Some Custom VPC"
  }
}

resource "aws_subnet" "some_public_subnet" {
  vpc_id            = aws_vpc.some_custom_vpc.id
  cidr_block        = var.network_cidr_a
  availability_zone = var.zone_a
  map_public_ip_on_launch = true

  tags = {
    Name = "Some Public Subnet"
  }
}

resource "aws_subnet" "some_private_subnet" {


  vpc_id            = aws_vpc.some_custom_vpc.id
  cidr_block        = var.network_cidr_b
  availability_zone = var.zone_b
  map_public_ip_on_launch = true

  tags = {
    Name = "Some Private Subnet"
  }
}

resource "aws_internet_gateway" "some_ig" {
  vpc_id = aws_vpc.some_custom_vpc.id

  tags = {
    Name = "Some Internet Gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.some_custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.some_ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.some_ig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.some_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.some_custom_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "sq_sg" {
  name   = "HTTP, SSH  and port 9000"
  vpc_id = aws_vpc.some_custom_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_instance" "web_instance" {
#   ami           = "ami-027575f554fa61ccc"
#   instance_type = "t3.medium"
#   key_name      = "DevOps"
#   count = 1

#   subnet_id                   = aws_subnet.some_public_subnet.id
#   vpc_security_group_ids      = [aws_security_group.web_sg.id]
#   associate_public_ip_address = true
#   user_data     =  "${file("/configs/maven.sh")}"

#     tags = {
#     "Name" : "Maven"
#   }
# }

# resource "aws_instance" "sqube_instance" {
#   ami           = "ami-08602ac2d592c8c31"
#   instance_type = "t3.medium"
#   key_name      = "DevOps"
#   count = 1

#   subnet_id                   = aws_subnet.some_public_subnet.id
#   vpc_security_group_ids      = [aws_security_group.sq_sg.id]
#   associate_public_ip_address = true
#   user_data     =  "${file("/configs/sonarqube.sh")}"


#   tags = {
#     "Name" : "SonarQube"
#   }
# }

# resource "aws_instance" "jenkins_instance" {
#   ami           = "ami-027575f554fa61ccc"
#   instance_type = "t3.medium"
#   key_name      = "DevOps"
#   count = 1

#   subnet_id                   = aws_subnet.some_public_subnet.id
#   vpc_security_group_ids      = [aws_security_group.web_sg.id]
#   associate_public_ip_address = true
#   user_data     =  "${file("/configs/jenkins.sh")}"

  

#   tags = {
#     "Name" : "Jenkins"
#   }
# }

# resource "aws_instance" "ci_server_instance" {
#   ami           = "ami-027575f554fa61ccc"
#   instance_type = "t3.medium"
#   key_name      = "DevOps"
#   count = 1

#   subnet_id                   = aws_subnet.some_public_subnet.id
#   vpc_security_group_ids      = [aws_security_group.web_sg.id]
#   associate_public_ip_address = true
#   user_data     =  "${file("/configs/ci_server.sh")}"

  

#   tags = {
#     "Name" : "CI_Server"
#   }
# }

resource "aws_instance" "ci_server_docker_instance" {
  ami           = "ami-027575f554fa61ccc"
  instance_type = "t3.medium"
  key_name      = "DevOps"
  count = 1

  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data     =  "${file("/configs/ci_server_docker.sh")}"

  

  tags = {
    "Name" : "CI_Server_Docker"
  }
}

resource "aws_instance" "sqube_instance_2" {
  ami           = "ami-08602ac2d592c8c31"
  instance_type = "t3.medium"
  key_name      = "DevOps"
  count = 1

  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.sq_sg.id]
  associate_public_ip_address = true
  user_data     =  "${file("/configs/sonarqube_docker.sh")}"


  tags = {
    "Name" : "SonarQube_2"
  }
}


