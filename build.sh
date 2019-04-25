#!/bin/bash
NAME="imunes/vroot"
# set ulimits because if they are unlimited apparently the Linux kernel slows
# things down:
# - https://github.com/docker/for-linux/issues/73
# - https://github.com/docker/for-linux/issues/502
ULIMITS="--ulimit nofile=10240:10240 --ulimit nproc=65356:65536"
folder="debian-8"
tag="latest"

if [[ -n "$1" ]]; then
    tag="$1"
fi

if [[ -d "$tag" ]]; then
    folder="$tag"
    NAME="$NAME:$tag"
fi

echo "[+] Entering dir '$folder' and building '$NAME'."
sudo docker build $ULIMITS -t $NAME . -f $folder/Dockerfile
echo "[+] Built image '$NAME'."
