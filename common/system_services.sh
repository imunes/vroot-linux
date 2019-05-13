#!/bin/bash
set -e
source /build/buildconfig
set -x

# quagga, ssh, inetd, strongswan
$minimal_apt_get_install quagga rpcbind openssh-server openbsd-inetd ftpd telnetd strongswan

# configure Quagga
if [ -d "/etc/quagga/" ]; then
    cd /etc/quagga/
    touch zebra.conf ripd.conf ripngd.conf ospfd.conf ospf6d.conf
    touch bgpd.conf isisd.conf
    ln -s /boot.conf Quagga.conf
fi

cp /build/quaggaboot.sh /usr/local/bin
chmod 755 /usr/local/bin/quaggaboot.sh
ln -s /usr/lib/quagga/* /usr/local/bin

# disable telnetd and ftpd by default
sed -i"" -e "s/^\([^#]\)/#\1/g" /etc/inetd.conf
