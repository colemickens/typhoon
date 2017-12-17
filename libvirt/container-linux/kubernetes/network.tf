
resource "libvirt_network" "cluster_network" {
  # the name used by libvirt
  name = "cluster_network"

  # mode can be: "nat" (default), "none", "route", "bridge"
  mode = "nat"

  #  the domain used by the DNS server in this network
  #domain = "k8s.local"

  # the addresses allowed for domains connected and served by the DHCP server
  addresses = ["10.17.3.0/24"]

  # (optional) the bridge device defines the name of a bridge device
  # which will be used to construct the virtual network.
  # (only necessary in "bridge" mode)
  # bridge = "br7"

  # (Optional) one or more DNS forwarder entries.  One or both of
  # "address" and "domain" must be specified.  The format is:
  # dns_forwarder {
  #   address = "my address"
  #   domain = "my domain"
  # }
}

