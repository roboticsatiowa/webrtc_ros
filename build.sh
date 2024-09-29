#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -f $SCRIPT_DIR/Dockerfile -t webrtc_ros:latest $SCRIPT_DIR

