#! /bin/bash

xhost +
docker run --rm -it \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --shm-size=1g \
  ghidra/ghidra:11.4.2_PUBLIC
