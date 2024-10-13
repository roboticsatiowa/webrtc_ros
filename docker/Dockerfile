FROM ros:humble-ros-base-jammy

LABEL description="A docker file to test the released version of webrtc ROS"

ARG DEBIAN_FRONTEND=noninteractive

# Copy test script into container
COPY test-script.sh /test-script.sh
RUN chmod +x /test-script.sh

# Expose port for video streaming
EXPOSE 8080

# Entry point
CMD ["/test-script.sh"]
