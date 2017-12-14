#!/usr/bin/env bash

set -x
set -euo pipefail

export PREFIX="${PREFIX:-colemick}"
export CLUSTER=$(echo "$(date +%s)"|xargs printf "$PREFIX%x")

mkdir -p clusters/$CLUSTER
cp -a _template/* clusters/$CLUSTER/
sed -i "s/{{CLUSTER_NAME}}/${CLUSTER}/g" clusters/$CLUSTER/cluster.tf

# TODO: just no
# lol
killall ssh-agent || true
eval `ssh-agent`
ssh-add $HOME/.ssh/id_rsa

cd clusters/$CLUSTER
# TODO:cleanup
# don't bother, this is a one-shot deal right now anyway
# due to how suffix is new each run
#rm -rf .terra*
terraform init
terraform plan
terraform get --update
terraform apply

