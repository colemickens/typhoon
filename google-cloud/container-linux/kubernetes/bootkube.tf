# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/colemickens/terraform-render-bootkube.git?ref=b908d9d3a37900411704d9c49084b3c6349f9ff5"

  cluster_name = "${var.cluster_name}"
  api_servers  = ["${format("%s.%s", var.cluster_name, var.dns_zone)}"]
  etcd_servers = "${module.controllers.etcd_fqdns}"
  asset_dir    = "${var.asset_dir}"
  networking   = "${var.networking}"
  network_mtu  = 1440
  pod_cidr     = "${var.pod_cidr}"
  service_cidr = "${var.service_cidr}"
}
