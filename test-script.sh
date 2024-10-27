#!/usr/bin/env bash

# Function to check for webcam
check_webcam() {
    if [ -c /dev/video0 ]; then
        echo "Webcam detected at /dev/video0"
    else
        echo "No webcam found at /dev/video0"
        exit 1
    fi
}

# Function to start streaming from the webcam
start_streaming() {
    # Using ffmpeg to display webcam feed
    ffmpeg -f v4l2 -i /dev/video0 -vf "format=yuv420p" -f x11grab -r 30 -video_size 640x480 - | ffplay - 

    # Uncomment this to use gstreamer instead
    # gst-launch-1.0 v4l2src ! videoconvert ! autovideosink
}

# Main script execution
check_webcam
start_streaming

# Check if streaming was successful
if [ $? -ne 0 ]; then
    echo "Failed to start streaming"
    exit 1
fi
