FROM ros:noetic

RUN apt-get update && apt-get install -y \
    net-tools

RUN apt-get update && apt-get install -y \
    ros-noetic-tf

RUN echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc

WORKDIR  /usr/catkin_ws
COPY src src
COPY scripts scripts

RUN . /opt/ros/noetic/setup.sh && \
    catkin_make

RUN echo "source devel/setup.bash" >> /etc/bash.bashrc
# CMD /bin/sh src/scripts/launch.sh
