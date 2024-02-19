#!/bin/bash
docker build -t niceda/debian:latest .

docker run -d --platform linux/amd64 --name dev -p 2222:22 --privileged=true -v "$HOME/Documents/Code/qz/":/Users/fida/Documents/Code/qz -v "$HOME/.dotfiles/":/home/fida/.dotfiles niceda/debian:latest
docker run -d --platform linux/amd64 --name dev-latest -p 8888:22 --privileged=true -v "$HOME/Documents/Code/qz/":/Users/fida/Documents/Code/qz -v "$HOME/.dotfiles/":/home/fida/.dotfiles niceda/debian:latest

echo `export PATH=$HOME/.local/bin:$PATH` >> /$HOME/.bashrc
source ~/.bashrc
