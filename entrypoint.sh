#!/bin/sh -l
mkdir -p ~/colcon_ws/src
cd ~/
echo $1 >> workspace.repos
vcs import src < workspace.repos
mkdir /artifacts

colcon build --install-base /artifacts \
    --cmake-force-configure \
    --cmake-args \
        -DCMAKE_TOOLCHAIN_FILE="/opt/nvidia/vpi3/samples/08-cross_aarch64_l4t/Toolchain_aarch64_l4t.cmake"
