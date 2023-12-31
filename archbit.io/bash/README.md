# XFS Partitioning Script

This Bash script simplifies the process of partitioning an attached volume as XFS and mounting it on a specified mount point. It provides an efficient way to perform these operations, including partitioning, formatting, mounting, and updating `/etc/fstab`.

It was created as part of a DevOps Junior challenge.

## Usage

Before running the script, please make sure it's executable. You can do this by running the following command in your terminal: 

   ```bash chmod +x xfs_partition.sh```
   
1. Run the script by executing it in your terminal:

   ```bash ./xfs_partition.sh```

2. The script will prompt you to provide the following information:

   - The device you want to partition as XFS (default: /dev/sdb).
   - The mount point for the new XFS partition (default: /mnt/xfs).

3. The script will perform the following tasks:

   - Partition the selected device as XFS.
   - Determine the Linux distribution and install necessary packages using `apt` or `yum`.
   - Format the partition as XFS.
   - Create the specified mount point and mount the XFS partition.
   - Update `/etc/fstab` to ensure the partition is mounted at boot.

Upon successful execution, the script will confirm that the device has been partitioned as XFS and provide the access path.



