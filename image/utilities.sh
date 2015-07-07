#!/bin/bash
set -e
source /build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install curl less nano vim psmisc tcpdump iputils-ping \
iputils-arping iputils-tracepath net-tools file telnet isc-dhcp-client nmap \
dnsutils iperf netcat man
