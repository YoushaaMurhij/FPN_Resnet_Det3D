FROM nvidia/cuda:11.0-devel-ubuntu20.04

#install required libs and packages
RUN apt-get update  \
	&& apt-get install -y --no-install-recommends wget build-essential git curl ca-certificates python3-pip \
	&& rm -rf /var/lib/apt/lists/*

# ROS Noetic installation
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y lsb-release
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt update && apt install -y ros-noetic-desktop
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash"
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

# Update pip & install pytorch
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wheel torch torchvision  easydict opencv-python numpy torchsummary tensorboard scikit-learn 

RUN apt-get update  \
	&& apt-get install -y --no-install-recommends ros-noetic-jsk-recognition-msgs \
	&& rm -rf /var/lib/apt/lists/*


# ARG USER=docker_centerpoint
# ARG UID=1000
# ARG GID=1000
# # default password
# ARG PW=user 

# RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && adduser ${USER} sudo

# WORKDIR /home/${USER}
# RUN cd /home/${USER} && mkdir -p catkin_ws/src && chown -R ${UID}:${GID} ./

# USER ${UID}:${GID}
