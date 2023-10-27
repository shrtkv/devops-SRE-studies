#!/bin/bash

function trap_ctrlc() {
  echo " "
  echo "Interrupted. Exiting..."
  exit 2
}
trap "trap_ctrlc" 2
read -p "What is the device to be partitioned as XFS? (default: /dev/sdb):" DEVICE
DEVICE=${DEVICE:-/dev/sdb}
echo "Selected device: $DEVICE"
read -p "What is the mount point for the new partition? (default: /mnt/xfs): " MOUNT_POINT
MOUNT_POINT=${MOUNT_POINT:-/mnt/xfs}
echo "Selected mount point: $MOUNT_POINT"
check_command() {
  if [ $? -ne 0 ]; then
    echo "Error: $1 failed"
    exit 1
  fi
}
sudo parted $DEVICE mklabel gpt && sudo parted $DEVICE mkpart primary ext4 0% 100%
check_command "Partitioning"
if [ -f "/etc/debian_version" ]; then
  PACKAGE_MANAGER="apt"
elif [ -f "/etc/redhat-release" ]; then
  PACKAGE_MANAGER="yum"
else
  echo "Unsupported Linux distribution."
  exit 1
fi
sudo $PACKAGE_MANAGER update && sudo $PACKAGE_MANAGER install -y xfsprogs
check_command "Package installation"
sudo mkfs.xfs $DEVICE
check_command "Formatting as XFS"
sudo mkdir -v -p $MOUNT_POINT && sudo mount -t xfs $DEVICE $MOUNT_POINT
check_command "Mounting"
echo "${DEVICE} $MOUNT_POINT xfs defaults 0 0" | sudo tee -a /etc/fstab
check_command "Updating /etc/fstab"
echo ">>> ${DEVICE} partitioned as XFS."
echo ">>> You can access it at $MOUNT_POINT."
