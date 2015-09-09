#!/bin/bash

git pull
cd image
sudo docker build -t imunes/vroot:base .

echo -n "Push to docker? [y/n]"
read ans

if [ $ans == "y" ]; then
    sudo docker push imunes/vroot:base
fi
