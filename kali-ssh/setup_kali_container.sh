#!/bin/bash

# Variables
CONTAINER_NAME=kali-container
IMAGE=kalilinux/kali-rolling
SSH_PORT=2222 # Change port here defualt is 2222
USERNAME=PLACE_USERNAME_HERE
PASSWORD=PLACE_PASS_HERE
DATA_DIR=$(pwd)/kali-data

# Create data directory if it doesn't exist
mkdir -p $DATA_DIR

echo "[*] Pulling Kali image..."
docker pull $IMAGE

echo "[*] Creating and running the Kali container..."
docker run -dit \
  --name $CONTAINER_NAME \
  -p $SSH_PORT:22 \
  -v $DATA_DIR:/root/data \
  $IMAGE

echo "[*] Installing OpenSSH server, sudo, and setting up user..."
docker exec -it $CONTAINER_NAME bash -c "
apt update && apt install -y openssh-server sudo && \
mkdir -p /var/run/sshd && \
useradd -m -s /bin/bash $USERNAME && \
echo '$USERNAME:$PASSWORD' | chpasswd && \
usermod -aG sudo $USERNAME && \
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
service ssh start
"

echo "[*] Container setup complete."
echo "SSH into the container with:"
echo "ssh $USERNAME@localhost -p $SSH_PORT"
echo "Password: $PASSWORD"
echo "Your persistent storage is mounted at /root/data inside the container."
