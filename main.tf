data "oci_core_images" "OLImageOCID-ol7" {
  compartment_id           = "${var.compartment_ocid}"
  operating_system         = "Windows" 
  operating_system_version = "Server 2016 Standard"

  # exclude GPU specific images
  filter {
    name   = "display_name"
    values = ["^Windows-Server-2016-Standard-Edition-VM-Gen2-([\\.0-9-]+)$"]
    regex  = true
  }
}

# Cloudinit
# Generate a new strong password for your instance
resource "random_string" "instance_password" {
  length  = 16
  special = true
}

# Use the cloudinit.ps1 as a template and pass the instance name, user and password as variables to same
data "template_file" "cloudinit_ps1" {
  vars = {
    instance_user     = "opc"
    instance_password = "${var.instance_password}"
    instance_name     = "${var.instance_name}"
  }

  template = "${file("userdata/cloudinit.ps1")}"
}

data "template_cloudinit_config" "cloudinit_config" {
  gzip          = false
  base64_encode = true

  # The cloudinit.ps1 uses the #ps1_sysnative to update the instance password and configure winrm for https traffic
  part {
    filename     = "cloudinit.ps1"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.cloudinit_ps1.rendered}"
  }

  # The cloudinit.yml uses the #cloud-config to write files remotely into the instance, this is executed as part of instance setup
  part {
    filename     = "cloudinit.yml"
    content_type = "text/cloud-config"
    content      = "${file("userdata/cloudinit.yml")}"
  }
}

# Network

data "oci_identity_availability_domain" "ad" {
  compartment_id = "${var.tenancy_ocid}"
  ad_number      = "${var.availability_domain}" 
}

resource "oci_core_vcn" "OnixCapvcn" {
  cidr_block     = "${var.cidr_bl}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "OnixCapitalVcn"
  dns_label      = "Onixvcn"
}

resource "oci_core_internet_gateway" "OnixCapinternet_gateway" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "OnixCapitalInternetGateway"
  vcn_id         = "${oci_core_vcn.OnixCapvcn.id}"
}

resource "oci_core_route_table" "OnixCaproute_table" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.OnixCapvcn.id}"
  display_name   = "OnixCapitalRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.OnixCapinternet_gateway.id}"
  }
}

# https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/accessinginstance.htm#one

resource "oci_core_security_list" "OnixCapsecurity_list" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.OnixCapvcn.id}"
  display_name   = "OnixCapitalSecurityList"

  # allow inbound remote desktop traffic
  ingress_security_rules {
    protocol  = "6"         # tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      # These values correspond to the destination port range.
      min = 3389
      max = 3389
    }
  }

  # allow inbound winrm traffic
  ingress_security_rules {
    protocol  = "6"         # tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      # These values correspond to the destination port range.
      min = 5985
      max = 5986
    }
  }

  # allow all outbound traffic
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
    stateless   = false
  }
}

resource "oci_core_subnet" "OnixCapsubnet" {
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  cidr_block          = "${var.sn_cidr_bl}"
  display_name        = "OnixCapitalSubnet"
  dns_label           = "Onixsubnet"
  security_list_ids   = ["${oci_core_security_list.OnixCapsecurity_list.id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.OnixCapvcn.id}"
  route_table_id      = "${oci_core_route_table.OnixCaproute_table.id}"
  dhcp_options_id     = "${oci_core_vcn.OnixCapvcn.default_dhcp_options_id}"
}

# Compute

resource "oci_core_instance" "OnixCapinstance" {
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.instance_name}"
  shape               = "${var.InstanceShape}" 

  # Refer cloud-init in https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/datatypes/LaunchInstanceDetails
  metadata = {
    # Base64 encoded YAML based user_data to be passed to cloud-init
    user_data = "${data.template_cloudinit_config.cloudinit_config.rendered}"
  }

  create_vnic_details {
    subnet_id      = "${oci_core_subnet.OnixCapsubnet.id}"
    hostname_label = "winmachine"
  }

  source_details {
    boot_volume_size_in_gbs = "${var.BootVolSize}"
    source_id               = "${data.oci_core_images.OLImageOCID-ol7.images.0.id}"
    source_type             = "image"
  }
}

data "oci_core_instance_credentials" "instance_credentials" {
  instance_id = "${oci_core_instance.OnixCapinstance.id}"
}

resource "oci_core_volume" "OnixCapvolume" {
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "OnixCapitalVolume"
  size_in_gbs         = "${var.BlockVolSize}"
}

resource "oci_core_volume_attachment" "OnixCapvolume_attachment" {
  attachment_type = "iscsi"
  instance_id     = "${oci_core_instance.OnixCapinstance.id}"
  volume_id       = "${oci_core_volume.OnixCapvolume.id}"
}

# Outputs

output "username" {
  value = ["${data.oci_core_instance_credentials.instance_credentials.username}"]
}

output "password" {
  value = ["${var.instance_password}"]
}

output "instance_public_ip" {
  value = ["${oci_core_instance.OnixCapinstance.public_ip}"]
}

output "instance_private_ip" {
  value = ["${oci_core_instance.OnixCapinstance.private_ip}"]
}
