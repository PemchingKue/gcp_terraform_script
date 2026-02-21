resource "google_compute_instance" "my-web-server" {

  name         = var.instance_name
  description  = var.instance_description
  machine_type = var.machine_type
  zone         = var.zone

  ############################
  # Boot Disk
  ############################
  boot_disk {
    auto_delete = true
    device_name = var.instance_name

    initialize_params {
      image = var.boot_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }

    mode = "READ_WRITE"
  }

  ############################
  # General Settings
  ############################
  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = var.instance_labels

  ############################
  # Metadata
  ############################
  metadata = {
    enable-osconfig = var.enable_osconfig
    startup-script  = var.startup_script
  }

  ############################
  # Network Interface
  ############################
  network_interface {
    subnetwork  = var.subnetwork
    stack_type  = var.stack_type
    queue_count = 0

    access_config {
      network_tier = var.network_tier
    }
  }

  ############################
  # Scheduling
  ############################
  scheduling {
    automatic_restart   = var.automatic_restart
    on_host_maintenance = var.on_host_maintenance
    preemptible         = var.preemptible
    provisioning_model  = var.provisioning_model
  }

  ############################
  # Service Account
  ############################
  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  ############################
  # Shielded VM
  ############################
  shielded_instance_config {
    enable_secure_boot          = var.enable_secure_boot
    enable_vtpm                 = var.enable_vtpm
    enable_integrity_monitoring = var.enable_integrity_monitoring
  }

  ############################
  # Tags
  ############################
  tags = var.instance_tags
}

#######################################################
# Ops Agent Policy Module
#######################################################

module "ops_agent_policy" {
  source        = "github.com/terraform-google-modules/terraform-google-cloud-operations/modules/ops-agent-policy"
  project       = var.project_id
  zone          = var.zone
  assignment_id = var.ops_agent_assignment_id

  agents_rule = {
    package_state = var.ops_agent_package_state
    version       = var.ops_agent_version
  }

  instance_filter = {
    all = false
    inclusion_labels = [{
      labels = {
        (var.ops_agent_label_key) = var.ops_agent_label_value
      }
    }]
  }
}