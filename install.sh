#!/bin/bash





## PREINSTALLATION

# Verify network connectivity
ping -c 2 linux.org

# If fail, break.

# Show available disks.
fdisk -l

# Prompt for disk to use.
# Query for hostname


# Partition the Disk
parted -a optimal /dev/$$$$$
mklabel gpt
unit mib
mkpart primary 1 3
name 1 grub
set 1 bios_grub on
mkpart primary 3 131
name 2 boot
set 2 boot on
# fills the rest of the drive
mkpart primary 131 -1
name 3 rootfs
print
q

# Format the Disks
mkfs.vfat /dev/$$$$1
mkfs.ext2 -L "boot" /dev/$$$$2
mkfs.ext4 -L "rootfs" /dev/$$$$3

# Mount the Disks
mkdir /mnt/boot
mount /dev/$$$$2 /mnt/boot
mount /dev/$$$$3 /mnt

## INSTALLATION
# Select the mirrors

# Install packages
pacstrap /mnt base base-devel sudo vim grub net-tools wireless_tools

# Generate FSTAB file
genfstab -U /mnt >> /mnt/etc/fstab

# Change root into the system
arch-chroot /mnt

# Generate HOSTNAME file
echo "XXXXXXX" > /etc/hostname

# Set Locale to Melbourne
ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime

# in the file /etc/locale.gen
# find #en_US.UTF-8 UTF-8
# replace with en_US.UTF-8 UTF-8

# Generate localization
locale.gen

STOPPED at 7:44
