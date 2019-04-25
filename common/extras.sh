#!/bin/bash
set -e
source /build/buildconfig
set -x

# extra tools
$minimal_apt_get_install vim bind9 lighttpd postfix isc-dhcp-server dovecot-pop3d \
ettercap-text-only tcpreplay hping3 p0f elinks iperf iftop scapy bsd-mailx tayga
