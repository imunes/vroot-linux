#!/bin/bash
set -e
source /build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install psmisc tcpdump iputils-ping \
iputils-arping net-tools file isc-dhcp-client procps \
dnsutils traceroute ettercap-text-only procps bash
