#!/bin/bash
set -e
source /build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install man curl less file nano vim-tiny psmisc tcpdump \
 iputils-ping iputils-arping iputils-tracepath net-tools dnsutils traceroute \
 telnet netcat ftp iptables isc-dhcp-client ndisc6 radvd lsof strace
