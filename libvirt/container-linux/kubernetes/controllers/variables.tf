variable "cluster_name" {
  type        = "string"
  description = "Unique cluster name"
}

variable "ssh_authorized_key" {
  type        = "string"
  description = "SSH public key for logging in as user 'core'"
}
variable "count" {
  type        = "string"
  description = "Number of controller compute instances the instance group should manage"
}

variable "network_id" {
  type        = "string"
  description = "The libvirt network id to join"
}

variable "service_cidr" {
  description = <<EOD
CIDR IP range to assign Kubernetes services.
The 1st IP will be reserved for kube_apiserver, the 10th IP will be reserved for kube-dns.
EOD

  type    = "string"
  default = "10.3.0.0/16"
}

// kubeconfig

variable "kubeconfig_ca_cert" {
  type        = "string"
  description = "Generated kubeconfig CA certificate"
}

variable "kubeconfig_kubelet_cert" {
  type        = "string"
  description = "Generated kubeconfig kubelet certificate"
}

variable "kubeconfig_kubelet_key" {
  type        = "string"
  description = "Generated kubeconfig kubelet private key"
}

variable "kubeconfig_server" {
  type        = "string"
  description = "Generated kubeconfig server"
}
