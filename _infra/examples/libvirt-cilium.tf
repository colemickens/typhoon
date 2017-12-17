provider "libvirt" {
  uri = "qemu:///system"
}

module "libvirt-cluster" {
  source = "../../../libvirt/container-linux/kubernetes"

  cluster_name       = "{{CLUSTER_NAME}}"
  controller_count   = 1
  worker_count       = 3
  ssh_authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD1dGZ0YQ+MgcomNUIdKHuWm4MA9a4BKOSNyo60cbts9ysuP3qahjmyrqYZVd4krjXpCtHSoav1fc2EJLhiJFJc3b+nZIJZtWQoesCTuSKjXV8ZHwSWjoIqjZCNWtOPiNYSYHj4xly5OfdlQavWfPOwwrM57sWTtv+9Ji7sR85x5QkpeVltj5uOVxnC4Tz/UYbN/oWU3PDAhEn7GAvEOLAfXSJLtSkj40+kehB2G0T4voXsZcq9fgFqAQ7ia13qkBkZ8AN9EAgQxbHELKJUmW1j7FDhl6exYhfoqycIDpdHW/ogHsiZi/Ajz/IM9orhyBCrBNN1c8miJk6UxyI+Dy0V cole.mickens@gmail.com"

  # output assets dir
  asset_dir = "./_output"
}
