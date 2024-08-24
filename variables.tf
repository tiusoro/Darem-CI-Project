variable "region" {
  default = "af-south-1"
}

variable "zone_a" {
  default = "af-south-1a"
}
variable "zone_b" {
  default = "af-south-1b"
}

variable "network_cidr_a" {
  default = "10.0.1.0/24"
}
variable "network_cidr_b" {
  default = "10.0.2.0/24"
}

# variable "network_name" {
#   default = "tf-custom-machine"
# }

# variable "machine_type" {
#   description = "In the form of custom-CPUS-MEM, number of CPUs and memory for custom machine. https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#specifications"
#   default     = "custom-6-65536-ext"
# }

# variable "min_cpu_platform" {
#   description = "Specifies a minimum CPU platform for the VM instance. Applicable values are the friendly names of CPU platforms, such as Intel Haswell or Intel Skylake. https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform"
#   default     = "Automatic"
# }

# variable "name" {
#   description = "Name prefix for the nodes"
#   default     = "tf-custom"
# }

# variable "num_nodes" {
#   description = "Number of nodes to create"
#   default     = 1
# }

# variable "image_family" {
#   default = "centos-7"
# }

# variable "image_project" {
#   default = "centos-cloud"
# }

# variable "disk_auto_delete" {
#   description = "Whether or not the disk should be auto-deleted."
#   default     = true
# }

# variable "disk_type" {
#   description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
#   default     = "pd-ssd"
# }

# variable "disk_size_gb" {
#   description = "The size of the image in gigabytes."
#   default     = 10
# }

# variable "access_config" {
#   description = "The access config block for the instances. Set to [{}] for ephemeral external IP."
#   type        = "list"
#   default     = []
# }

# variable "network_ip" {
#   description = "Set the network IP of the instance. Useful only when num_nodes is equal to 1."
#   default     = ""
# }

# variable "node_tags" {
#   description = "Additional compute instance network tags for the nodes."
#   type        = "list"
#   default     = []
# }

# variable "startup_script" {
#   description = "Content of startup-script metadata passed to the instance template."
#   default     = ":"
# }

# variable "metadata" {
#   description = "Map of metadata values to pass to instances."
#   type        = "map"
#   default     = {}
# }

# variable "depends_id" {
#   description = "The ID of a resource that the instance group depends on."
#   default     = ""
# }

# variable "service_account_email" {
#   description = "The email of the service account for the instance template."
#   default     = ""
# }

# variable "bastion_image_family" {
#   default = "centos-7"
# }

# variable "bastion_image_project" {
#   default = "centos-cloud"
# }

# variable "bastion_machine_type" {
#   default = "n1-standard-1"
# }