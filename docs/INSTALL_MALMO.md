

## Install requirements

```bash
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
&& distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
&& curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list \
&& sudo apt-get update \
&& sudo apt-get install -y libopenal-dev python3-pip ffmpeg openjdk-8-jdk git xvfb xpra python-gdk2-dev
```

## Install malmo

```bash
$ pip install malmo \
&& python3 -c "import malmo.minecraftbootstrap;malmo.minecraftbootstrap.download(buildMod=True)" \
&& export MALMO_XSD_PATH="/data/home/${USER}/MalmoPlatform/Schemas" \
&& echo 'export MALMO_XSD_PATH="/data/home/${USER}/MalmoPlatform/Schemas"' >> ~/.bashrc
```

## Launch Minecraft client

```bash
$ sudo docker run -it -p 5901:5901 -p 6901:6901 -p 8888:8888 -p 10000:10000 -e VNC_PW=vncpasswor
d andkram/malmo
```
