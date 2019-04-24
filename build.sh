#!/bin/bash
NAME="imunes/vroot"
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
cd $folder && sudo docker build -t $NAME .
echo "[+] Built image '$NAME'."
