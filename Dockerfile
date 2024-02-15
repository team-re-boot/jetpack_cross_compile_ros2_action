# Container image that runs your code
FROM nvcr.io/nvidia/jetpack-linux-aarch64-crosscompile-x86:6.0-dp

RUN apt update && apt install -y \
    cmake \
    git \
    wget \
    python3-pip \
    qemu-user-static \
    g++-aarch64-linux-gnu \
    g++-arm-linux-gnueabihf \
    pkg-config-aarch64-linux-gnu

RUN python3 -m pip install -U \
    vcstool \
    colcon-common-extensions

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
