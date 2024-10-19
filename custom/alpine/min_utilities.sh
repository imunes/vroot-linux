#!/bin/bash
set -e
source /build/buildconfig
set -x

## Often used tools.
apk add psmisc tcpdump iputils-ping \
iputils-arping net-tools file bind-tools \
traceroute procps iproute2 bash
