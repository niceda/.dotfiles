#!/bin/bash
docker run --name cppdebian11.7 --rm -it --user=$UID:$(id -g $USER) -v "$PWD/QZ":/QZ cppdebian11.7
docker run --name cppdebian11.7-v --rm -it --user=$UID:$(id -g $USER) -v "$PWD/QZ":/QZ cppdebian11.7
