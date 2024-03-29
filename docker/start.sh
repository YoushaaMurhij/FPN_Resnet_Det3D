#!/bin/bash

cd "$(dirname "$0")"
cd ..
cd ..
cd ..
workspace_dir=$PWD

if [ "$(docker ps -aq -f status=exited -f name=open3d)" ]; then
    docker rm open3d;
fi

docker run -it -d --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --privileged \
    --name sfa3d \
    --net "host" \
    --shm-size=8192M \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $workspace_dir/:/home/docker_sfa3d/catkin_ws:rw \
    x64noetic/sfa3d:latest
