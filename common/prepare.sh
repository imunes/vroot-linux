#!/bin/bash
set -e
source /build/buildconfig
set -x

# Prevent initramfs updates from trying to run grub and lilo.
# https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=594189
export INITRD=no
mkdir -p /etc/container_environment
echo -n no > /etc/container_environment/INITRD

release=$(egrep ^ID= /etc/os-release | cut -d= -f2)
if [[ "$release" == "debian" ]]; then
    # Remove jessie-updates as it is not available
    sed -i '/jessie-updates/d' /etc/apt/sources.list
    # Enable Debian contrib and non-free repos.
    sed -i '/^deb/ s/$/ contrib non-free/' /etc/apt/sources.list
fi
if [[ "$release" == "ubuntu" ]]; then
    sed -i 's/^#\s*\(deb.*main restricted\)$/\1/g' /etc/apt/sources.list
    sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
    sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list
fi

apt-get update

# Fix some issues with APT packages.
# See https://github.com/dotcloud/docker/issues/1024
dpkg-divert --local --rename --add /sbin/initctl
ln -sf /bin/true /sbin/initctl

# Replace the 'ischroot' tool to make it always return true.
# Prevent initscripts updates from breaking /dev/shm.
# https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
# https://bugs.launchpad.net/launchpad/+bug/974584
dpkg-divert --local --rename --add /usr/bin/ischroot
ln -sf /bin/true /usr/bin/ischroot

# apt-utils fix
$minimal_apt_get_install apt-utils

## Upgrade all packages.
apt-get dist-upgrade -y --no-install-recommends -o Dpkg::Options::="--force-confold"
