#!/bin/bash
set -e
source /build/buildconfig
set -x

## Install init process.
cp /build/iinit.sh /usr/bin/
chmod +x /usr/bin/iinit.sh
