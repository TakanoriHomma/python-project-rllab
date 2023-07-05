#!/bin/bash

PARENT_DIR=$(pwd|xargs dirname)

docker run --name assignment3 -it --rm -d --gpus all --ipc=host \
           --ulimit memlock=-1 --ulimit stack=67108864 \
           -v /tmp/.X11-unix:/tmp/.X11-unix: \
           -v "${PARENT_DIR}":/home/"${USER}"/assignment3 \
           -e DISPLAY="${DISPLAY}" \
           -p 63322:63322 \
           -p 6006:6006 \
           -p 6007:6007 \
           kadai3_vae jupyter lab --config='./assignment3/jupyter_lab_config.py'
