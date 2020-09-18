#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

# Add the NVIDIA drivers repo
# https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html
sudo apt-get install linux-headers-$(uname -r)
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list

# Install drivers, docker and docker compose
sudo apt-get update
sudo apt-get -y install cuda-drivers docker docker.io  python3-pip
sudo pip3 install docker-compose

export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64 ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
sudo /usr/bin/nvidia-persistenced --verbose

# Restart the docker service for the changes to take effect
sudo systemctl start docker
sudo systemctl enable docker

# Get the NVIDIA plugin for docker
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit nvidia-docker2

sudo systemctl daemon-reload
sudo systemctl restart docker