FROM ros:humble-perception


# ROS dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ros-humble-cv-bridge \
    git \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
    
RUN apt-get install ffmpeg

RUN apt-get install -y --no-install-recommends libjpeg-turbo8 libjpeg-turbo8-dev

RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1

WORKDIR /home/3rdparty/jsoncpp/
RUN git clone https://github.com/open-source-parsers/jsoncpp.git . && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF -DARCHIVE_INSTALL_DIR=. -G "Unix Makefiles" .. &&  \
    make && \
    make install

ENV LD_LIBRARY_PATH=/usr/local/lib/

WORKDIR /home/webrtc_ws
COPY . /home/webrtc_ws/src/

RUN git clone https://github.com/GT-RAIL/async_web_server_cpp.git /home/webrtc_ws/src/async_web_server_cpp/



ENTRYPOINT ["/ros_entrypoint.sh"]
