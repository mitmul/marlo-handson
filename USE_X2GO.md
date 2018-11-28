# How to use X2Go for Malmo

Do the below instructions AFTER finsihing all the steps found in `README.md`.

### 6. Create a Conda environment for MarLo

On the VM,
```
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
&& distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
&& curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list \
&& sudo apt-get update \
&& sudo apt-get install -y libopenal-dev
```

```
$ conda config --set always_yes yes \
&& conda create python=3.6 --name marlo \
&& conda config --add channels conda-forge \
&& conda activate marlo \
&& conda install -c crowdai malmo matplotlib ipython numpy scipy opencv \
&& pip install git+https://github.com/crowdAI/marLo.git \
&& pip install chainer==5.0.0 cupy-cuda92==5.0.0 chainerrl==0.5.0
```

```
$ mkdir /anaconda/envs/marlo/Minecraft/run/config \
&& echo 'enabled=false' > /anaconda/envs/marlo/Minecraft/run/config/splash.properties
```

### 7. Install X2Go client on your machine

Just follow the instruction here: [Installing the Qt-based X2Go Client](https://wiki.x2go.org/doku.php/doc:installation:x2goclient). Please note that you only needs the "client". You do not have to setup the X2Go server on the VM. It has already been ready to go!

After the installation of X2Go, just launch the client and connect to the VM by following this instruction: [Installing and configuring X2Go client](https://docs.microsoft.com/azure/machine-learning/data-science-virtual-machine/linux-dsvm-intro#installing-and-configuring-x2go-client).

You will see the Ubuntu desktop in the X2Go client window.

### 8. Start a Minecraft client

In the X2Go window, launch a Terminal Emulater from the left top "Applications" menu, and just run the command below to start a Minecraft client!
```
$ source activate marlo \
&& $MALMO_MINECRAFT_ROOT/launchClient.sh -port 10000
```

Then you can see this screen on the X2Go client window.

![](images/minecraft.png)
