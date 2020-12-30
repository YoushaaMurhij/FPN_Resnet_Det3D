#!/bin/bash
#     export PYTHONPATH=\"${PYTHONPATH}:/home/docker_open3d/catkin_ws/src/Open3D_ROS/Open3D-ML\";

docker exec -it sfa3d \
    /bin/bash -c "source /opt/ros/noetic/setup.bash;
    cd /home/docker_sfa3d/catkin_ws;
    source /home/docker_sfa3d/catkin_ws/devel/setup.bash;
    /bin/bash"
