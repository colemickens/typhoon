#TODO: support multi-controller

output "api_servers" {
  value = [ "${libvirt_domain.controller_domain.network_interface.0.addresses.0}" ]
}

output "etcd_fqdns" {
  value = [ "${libvirt_domain.controller_domain.network_interface.0.addresses.0}" ]
}
