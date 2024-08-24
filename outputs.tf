
output "ec2_global_ips_CI_Server_Docker" {
  value = [for instance in aws_instance.ci_server_docker_instance : instance.public_ip]
}

output "ec2_global_ips_SONARQUBE_2" {
  value = [for instance in aws_instance.sqube_instance_2 : instance.public_ip]
}

