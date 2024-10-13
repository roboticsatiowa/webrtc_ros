#!/usr/bin/env bash

# Check if the webcam is accessible
if [ -c /dev/video0 ]; then
    echo "Webcam detected at /dev/video0"
else
    echo "No webcam found at /dev/video0"
    exit 1
fi

# Start streaming from the webcam (using ffmpeg or gstreamer)
# You might need to install these packages in your Dockerfile.
# Using ffmpeg to display webcam feed
ffmpeg -f v4l2 -i /dev/video0 -vf "format=yuv420p" -f x11grab -r 30 -video_size 640x480 - | ffplay -

# Or using gstreamer
# gst-launch-1.0 v4l2src ! videoconvert ! autovideosink
