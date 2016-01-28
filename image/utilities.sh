#!/bin/bash
set -e
source /build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install curl less nano vim psmisc tcpdump iputils-ping \
iputils-arping iputils-tracepath net-tools file telnet isc-dhcp-client nmap \
dnsutils netcat man dsniff traceroute ettercap-text-only tcpreplay hping3 p0f \
lsof strace elinks iperf iftop scapy bsd-mailx ndisc6 radvd iptables tayga
