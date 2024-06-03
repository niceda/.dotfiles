#!/bin/bash
docker build -t niceda/debian:11.7 .

docker run -d --platform linux/amd64 --name dev -p 2222:22 -p 8000:8000 -p 8001:8001 -p 8002:8002 --privileged=true -v "$HOME/Documents/Code/qz/":/Users/fida/Documents/Code/qz -v "$HOME/.dotfiles/":/home/fida/.dotfiles niceda/debian:11.7
docker run -d --name dev -p 2222:22 -p 8000:8000 -p 8001:8001 -p 8002:8002 --privileged=true -v "$HOME/Documents/Code/qz/":/Users/fida/Documents/Code/qz -v "$HOME/.dotfiles/":/home/fida/.dotfiles niceda/debian:11.7

echo `export PATH=$HOME/.local/bin:$PATH` >> /$HOME/.bashrc
source ~/.bashrc

docker run -d -it --name centos -p 2200:22 --privileged=true -v "$HOME/Documents/Code/qz/":/Users/fida/Documents/Code/qz -v "$HOME/.dotfiles/":/home/fida/.dotfiles centos:latest /usr/sbin/init
docker container stop debian
docker container rm debian
