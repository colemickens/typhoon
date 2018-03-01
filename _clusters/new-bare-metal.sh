#!/usr/bin/env bash

set -x
set -euo pipefail

DIR=$(pwd) #fixme

export TEMPLATE_NAME="${TEMPLATE_NAME:-"demo.tf"}"
export PREFIX="${PREFIX:-colemick}"
export CLUSTER="$(CLUSTER_NAME:-"$(echo "$(date +%s)"|xargs printf "$PREFIX%x")")"

export DEST="${DIR}/${CLUSTER}"

cp -a examples/destroy.sh $DEST/
cp -a examples/providers.tf $DEST/

cp -a examples/${TEMPLATE_NAME}.tf $DEST/cluster.tf

sed -i "s/{{CLUSTER_NAME}}/${CLUSTER}/g" $DEST/cluster.tf


# TODO: :/
killall ssh-agent || true
eval `ssh-agent`
ssh-add $HOME/.ssh/id_rsa


cd $DEST
terraform init
terraform plan
terraform get --update
terraform apply -auto-approve