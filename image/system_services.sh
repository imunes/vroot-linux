#!/bin/bash
set -e
source /build/buildconfig
set -x

## Install Quagga
$minimal_apt_get_install quagga
if [ -d "/etc/quagga/" ]; then
    cd /etc/quagga/
    touch zebra.conf ripd.conf ripngd.conf ospfd.conf ospf6d.conf bgpd.conf
    ln -s /boot.conf Quagga.conf
fi

cp /build/quaggaboot.sh /usr/local/bin
chmod 755 /usr/local/bin/quaggaboot.sh
ln -s /usr/lib/quagga/* /usr/local/bin
