resource "libvirt_volume" "cluster_controller_volume" {
  name           = "cluster_controller_volume.qcow2"
  #base_volume_id = "${libvirt_volume.cluster_base_volume.id}"
  source         = "/coreos.qcow2"
}

data "template_file" "cluster_controller_cloudinit" {
  template = "${file("${path.module}/cl/controller.yaml.tmpl")}"
  vars {
    etcd_name = "${var.cluster_name}"
    k8s_dns_service_ip   = "${cidrhost(var.service_cidr, 10)}"
    ssh_authorized_key = "${var.ssh_authorized_key}"
  }
}

resource "libvirt_cloudinit" "cluster_controller_cloudinit" {
  name = "cluster_controller_cloudinit.iso"
  user_data = "${data.template_file.cluster_controller_cloudinit.rendered}"
}


resource "libvirt_domain" "controller_domain" {
  name = "controller"
  memory = "2048"
  vcpu = 1

  firmware = "/usr/share/ovmf/x64/OVMF_CODE.fd"

  cloudinit = "${libvirt_cloudinit.cluster_controller_cloudinit.id}"

  network_interface {
    network_id = "${var.network_id}"
  }

  boot_device {
    dev = [ "hd" ]
  }

  disk {
    volume_id = "${libvirt_volume.cluster_controller_volume.id}"
  }
}