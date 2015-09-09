#!/bin/bash

git pull
cd image
sudo docker build -t imunes/vroot .
