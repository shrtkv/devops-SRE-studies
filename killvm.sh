#!/bin/bash
# proxmox killvm script (no qemu-guest machines), by tachi@proxmox forums

if [ $# -lt 1 ] ; then
   echo "./killvm.sh <vmid>"
   exit
fi

VMID=${1}

EXIST=`qm list | awk '{print $1}' | grep -c ${VMID}$`
if [ ${EXIST} -eq 1 ]; then
   PID=`ps waux | grep "/usr/bin/kvm" | grep "id ${VMID}" | awk '{print $2}'`
   echo "Kill VMID ${VMID} PID ${PID}"
   kill -9 ${PID}
else
   echo "VMID ${VMID} does not exist or is not runnnig!"
fi
