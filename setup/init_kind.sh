#!/bin/bash
set -ex
sudo yum update -y

# install docker
sudo yum install docker -y
# start docekr service
sudo systemctl start docker
# add ec2-user to docker group
sudo usermod -a -G docker ec2-user

# install kind
curl -sLo kind https://kind.sigs.k8s.io/dl/v0.11.0/kind-linux-amd64
sudo install -o root -g root -m 0755 kind /usr/local/bin/kind
rm -f ./kind

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -f ./kubectl

# create cluster
kind create cluster --config kind.yaml