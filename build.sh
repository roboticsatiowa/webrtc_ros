#!/usr/bin/env bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Build the Docker image
docker build -f "$SCRIPT_DIR/docker/Dockerfile" -t webrtc_ros:latest "$SCRIPT_DIR"

# Testing webcam access
docker run -it --rm \
    --device=/dev/video0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    --privileged \
    webrtc_ros:latest   