#!/bin/bash
read -p "What is the device to be partitioned as XFS? (default: /dev/sdb):" DEVICE 
DEVICE=${DEVICE:-/dev/sdb}
echo $DEVICE
read -p "What is the mount point for the new partition? (default: /mnt/xfs): " MOUNT_POINT
MOUNT_POINT=${MOUNT_POINT:-/mnt/xfs}
echo $MOUNT_POINT

sudo parted $DEVICE mklabel gpt && sudo parted $DEVICE mkpart primary ext4 0% 100%

if [ -f "/etc/debian_version" ]; then
	sudo apt-get update && sudo apt-get install -y xfsprogs
elif [ -f "/etc/redhat_release" ]; then
	echo "REDHAT"
fi

sudo mkfs.xfs ${DEVICE}
sudo mkdir -v -p $MOUNT_POINT && sudo mount ${DEVICE} $MOUNT_POINT

echo "${DEVICE_NAME} $MOUNT_POINT xfs defaults 0 0" | sudo tee -a /etc/fstab
#clear
echo ">>> ${DEVICE} partitioned as XFS. "
echo ">>> You can access at $MOUNT_POINT."
