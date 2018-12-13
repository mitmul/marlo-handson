#!/bin/bash

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
&& distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
&& curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list \
&& sudo apt-get update \
&& sudo apt-get install -y libopenal-dev

conda config --set always_yes yes \
&& conda create python=3.6 --name marlo \
&& conda config --add channels conda-forge \
&& conda activate marlo \
&& conda install -c crowdai malmo matplotlib ipython numpy scipy opencv \
&& pip install git+https://github.com/crowdAI/marLo.git \
&& pip install chainer==5.1.0 cupy-cuda92==5.1.0 chainerrl==0.5.0

sudo docker run -it \
-p 5901:5901 \
-p 6901:6901 \
-p 8888:8888 \
-p 10000-11000:10000-11000 \
-e VNC_PW=vncpassword andkram/malmo
