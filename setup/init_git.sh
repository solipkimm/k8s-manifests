#!/bin/bash
set -ex
sudo yum update -y

# install git
sudo yum install git -y

# set global git user configurations
git config --global user.name "solip"
git config --global user.email "solipkimm@gmail.com"

# clone github repository
git clone https://github.com/solipkimm/k8s-manifests.git