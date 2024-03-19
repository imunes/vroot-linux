#!/bin/bash
set -e
source /build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install curl less nano vim-tiny psmisc tcpdump iputils-ping \
iputils-arping iputils-tracepath net-tools file telnet isc-dhcp-client nmap \
dnsutils netcat-openbsd man dsniff traceroute ettercap-text-only tcpreplay \
hping3 p0f lsof strace elinks iperf iftop scapy bsd-mailx ndisc6 radvd iptables \
nftables tayga ftp rsyslog frr

# Install "Quagga"
if [ -d "/etc/frr/" ]; then
    cd /etc/frr/
    touch zebra.conf ripd.conf ripngd.conf ospfd.conf ospf6d.conf
    touch bgpd.conf isisd.conf
	chown frr:frr zebra.conf ripd.conf ripngd.conf ospfd.conf ospf6d.conf bgpd.conf isisd.conf
fi

cp /build/quaggaboot.sh /usr/local/bin
chmod 755 /usr/local/bin/quaggaboot.sh
ln -s /usr/lib/quagga/* /usr/local/bin
