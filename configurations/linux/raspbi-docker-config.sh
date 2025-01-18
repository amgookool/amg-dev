#! /bin/bash

# Create docker group
sudo groupadd docker

# Add current user to docker group
sudo usermod -aG docker $USER

# Enable docker service on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service