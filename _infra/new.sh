#!/usr/bin/env bash

set -x
set -euo pipefail

TEMPLATE_NAME="${1:-"libvirt-cilium"}"

export PREFIX="${PREFIX:-colemick}"
export CLUSTER=$(echo "$(date +%s)"|xargs printf "$PREFIX%x")


mkdir -p _clusters/$CLUSTER

cp -a examples/destroy.sh _clusters/$CLUSTER/
cp -a examples/providers.tf _clusters/$CLUSTER/

cp -a examples/${TEMPLATE_NAME}.tf _clusters/$CLUSTER/cluster.tf

sed -i "s/{{CLUSTER_NAME}}/${CLUSTER}/g" _clusters/$CLUSTER/cluster.tf


# TODO: :/
killall ssh-agent || true
eval `ssh-agent`
ssh-add $HOME/.ssh/id_rsa


cd _clusters/$CLUSTER
terraform init
terraform plan
terraform get --update
terraform apply -auto-approve
