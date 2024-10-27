FROM ros:humble-ros-base-jammy

LABEL description="A docker file to test the released version of webrtc ROS"

ARG DEBIAN_FRONTEND=noninteractive

# Update package list and install ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy test script into container
COPY test-script.sh /test-script.sh
RUN chmod +x /test-script.sh

# Expose port for video streaming
EXPOSE 8080

# Entry point
CMD ["/test-script.sh"]
