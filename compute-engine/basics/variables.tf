############################
# Project / Location
############################

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "zone" {
  description = "The GCP zone"
  type        = string
}

############################
# Instance Configuration
############################

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "instance_description" {
  description = "Description of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
}

variable "boot_image" {
  description = "Boot disk image"
  type        = string
}

variable "boot_disk_size" {
  description = "Boot disk size in GB"
  type        = number
}

variable "boot_disk_type" {
  description = "Boot disk type"
  type        = string
}

############################
# Network Configuration
############################

variable "subnetwork" {
  description = "Subnetwork self link"
  type        = string
}

variable "network_tier" {
  description = "Network tier for access config"
  type        = string
}

variable "stack_type" {
  description = "IP stack type"
  type        = string
}

############################
# Labels & Tags
############################

variable "instance_labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
}

variable "instance_tags" {
  description = "Network tags for the instance"
  type        = list(string)
}

############################
# Service Account
############################

variable "service_account_email" {
  description = "Service account email for the instance"
  type        = string
}

variable "service_account_scopes" {
  description = "OAuth scopes for the service account"
  type        = list(string)
}

############################
# Scheduling
############################

variable "automatic_restart" {
  description = "Enable automatic restart"
  type        = bool
}

variable "on_host_maintenance" {
  description = "Host maintenance behavior"
  type        = string
}

variable "preemptible" {
  description = "Whether the instance is preemptible"
  type        = bool
}

variable "provisioning_model" {
  description = "Provisioning model for the instance"
  type        = string
}

############################
# Shielded VM
############################

variable "enable_secure_boot" {
  description = "Enable Secure Boot"
  type        = bool
}

variable "enable_vtpm" {
  description = "Enable vTPM"
  type        = bool
}

variable "enable_integrity_monitoring" {
  description = "Enable integrity monitoring"
  type        = bool
}

############################
# Metadata
############################

variable "startup_script" {
  description = "Startup script for the instance"
  type        = string
}

variable "enable_osconfig" {
  description = "Enable OS Config"
  type        = string
}

############################
# Ops Agent Module
############################

variable "ops_agent_assignment_id" {
  description = "Ops Agent assignment ID"
  type        = string
}

variable "ops_agent_package_state" {
  description = "Ops Agent package state"
  type        = string
}

variable "ops_agent_version" {
  description = "Ops Agent version"
  type        = string
}

variable "ops_agent_label_key" {
  description = "Label key used for Ops Agent inclusion"
  type        = string
}

variable "ops_agent_label_value" {
  description = "Label value used for Ops Agent inclusion"
  type        = string
}