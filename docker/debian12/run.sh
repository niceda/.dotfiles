#!/bin/bash
docker run -d --name cppdebian -p 2222:22 --privileged=true -v "$HOME/QZ":/home/fida/QZ cppdebian11.7
