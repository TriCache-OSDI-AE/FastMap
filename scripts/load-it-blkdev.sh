#!/bin/bash

# replace with the underlying device
DEVICE=/dev/md127p1

set -x

echo 1 > /proc/sys/kernel/sysrq
echo 8 > /proc/sys/kernel/printk

#1G
#modprobe dmap perma_mmap_buf_size=262144

#8G
#modprobe dmap perma_mmap_buf_size=2097152

#16G
#modprobe dmap perma_mmap_buf_size=4194304
modprobe dmap perma_mmap_buf_size=$1

echo 1 > /sys/class/dmap/0_buffer_state

../ioctl/set ${DEVICE}

# At this point a new device /dev/dmap/dmap1 will
# appear. Using mmap() on this device will use
# the FastMap's optimized path.
