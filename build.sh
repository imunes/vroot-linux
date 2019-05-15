#!/bin/bash

NAME="imunes/template"
# set ulimits because if they are unlimited apparently the Linux kernel slows
# things down:
# - https://github.com/docker/for-linux/issues/73
# - https://github.com/docker/for-linux/issues/502
ULIMITS="--ulimit nofile=10240:10240 --ulimit nproc=65356:65536"
LATEST_FOLDER="debian-9"

tag="latest"
if [[ -n "$1" ]]; then
    tag="$1"
fi

if [[ -d "$tag" ]]; then
    folder="$tag"
else
    if [[ "$tag" == "latest" ]]; then
        folder=$LATEST_FOLDER
    else
        echo "[x] Tag '$tag' does not exist."
        exit
    fi
fi

image_name="$NAME:$tag"
start=$(date +%s.%N)
echo "[+] Building '$image_name' from '$folder'."
docker build $ULIMITS --tag=$image_name --file=$folder/Dockerfile . > /tmp/imunes_template_build_${tag}.log || exit 1
end=$(date +%s.%N)
runtime=$(echo "scale=5; (${end} - ${start})/1" | bc)
echo "[+] Built image '$image_name' in $runtime s."
