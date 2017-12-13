#!/usr/bin/env bash

export PREFIX="${PREFIX:-colemick}"
export CLUSTER=$(echo "$(date +%s)"|xargs printf "$PREFIX%x")

mkdir $CLUSTER
cp -a _template/* $CLUSTER/
sed -i "s/CLUSTER_NAME/${CLUSTER}/g" $CLUSTER/cluster.tf

cd $CLUSTER
# don't bother, this is a one-shot deal right now anyway
# due to how suffix is new each run
#rm -rf .terra*
terraform init
terraform plan
terraform get --update
terraform apply
