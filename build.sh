#!/bin/bash
NAME="imunes/vroot"
tag="debian-8"

if [[ -n "$1" ]]; then
    tag="$1"
fi

if [[ -d "$tag" ]]; then
    NAME="$NAME:$tag"
fi

echo "[+] Entering dir '$tag' and building."
cd $tag && sudo docker build -t $NAME .
echo "[+] Built image '$NAME'."
