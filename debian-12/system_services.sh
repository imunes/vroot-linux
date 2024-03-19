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

# disable telnetd and ftpd by default
sed -i"" -e "s/^\([^#]\)/#\1/g" /etc/inetd.conf
