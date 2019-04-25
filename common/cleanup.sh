#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get clean
rm -rf /build
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*

# clean up python bytecode
find / -name *.pyc -delete
find / -name *__pycache__* -delete

rm -f /etc/ssh/ssh_host_*
