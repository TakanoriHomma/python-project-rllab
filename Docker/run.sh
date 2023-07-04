#!/bin/bash

PARENT_DIR=$(pwd|xargs dirname)

docker run \
  --net=host \
  --gpus all \
  -v $HOME/.Xauthority:/root/.Xauthority:rw \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /etc/localtime:/etc/localtime:ro \
  -v /usr/share/vulkan/icd.d/nvidia_icd.json:/etc/vulkan/icd.d/nvidia_icd.json \
  -v /usr/share/vulkan/implicit_layer.d/nvidia_layers.json:/etc/vulkan/implicit_layer.d/nvidia_layers.json \
  -v /usr/share/glvnd/egl_vendor.d/10_nvidia.json:/usr/share/glvnd/egl_vendor.d/10_nvidia.json \
  -v "${PARENT_DIR}":/home/"${USER}"/torchenv:rw \
  -e ACCEPT_EULA=Y \
  -e DISPLAY=$DISPLAY \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -it --rm --name "torchenv" torchenv:2023.6.20
