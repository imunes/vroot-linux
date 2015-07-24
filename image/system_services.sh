#!/bin/bash
set -e
source /build/buildconfig
set -x

## Install init process.
cp /build/iinit.sh /usr/bin/
chmod +x /usr/bin/iinit.sh

## ssh, telnet, inetd, rpcbind, ...
$minimal_apt_get_install rpcbind openssh-server openbsd-inetd bind9 \
strongswan lighttpd postfix isc-dhcp-server dovecot-pop3d telnetd ftpd

## disable telnetd and ftpd by default
sed -i"" -e "s/^\([^#]\)/#\1/g" /etc/inetd.conf

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
