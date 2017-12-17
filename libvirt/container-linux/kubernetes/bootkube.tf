# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "../../../../terraform-render-bootkube"

  cluster_name = "${var.cluster_name}"
  api_servers  = ["${module.controllers.api_servers}"]
  etcd_servers = "${module.controllers.etcd_fqdns}"
  asset_dir    = "${var.asset_dir}"
  networking   = "${var.networking}"
  network_mtu  = 1440
  pod_cidr     = "${var.pod_cidr}"
  service_cidr = "${var.service_cidr}"
}
