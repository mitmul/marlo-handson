# MarLo Handson

## Requirement

For the content of this repository, you need
- Python 3.5+ environment with
    - Chainer v5.0.0
    - CuPy v5.0.0
    - ChainerRL v0.4.0
    - marlo v0.0.1.dev23

To follow the instruction below, you need
- Azure subscription

## Setup

### 1. Install the Azure CLI tool

```
$ pip install azure-cli
```

### 2. Login to Azure using the Azure CLI

```
$ az login
```

### 3. Select a subscription

List up all the subscriptions you have by
```
$ az account list --all
```

Then, specify one of them with
```
$ az account set --subscription [A SUBSCRIPTION ID]
```
Of cource you need to replace `[A SUBSCRIPTION ID]` with a specific ID you want to use.

### 4. Launch a GPU VM

First, you have to create a resource group:
```
$ az group create -g marLo-handson -l eastus
```

Next, let's cerate a data science VM:
```
$ az vm create \
--resource-group marLo-handson \
--name vm \
--admin-username ${USER} \
--public-ip-address-dns-name ${USER} \
--image microsoft-ads:linux-data-science-vm-ubuntu:linuxdsvmubuntu:latest \
--size Standard_NC6 \
--generate-ssh-keys
```

Then, you will see the message like following:
```
{
  "fqdns": "[YOUR USERNAME].eastus.cloudapp.azure.com",
  "id": "/subscriptions/[YOUR SUBSCRIPTION ID]/resourceGroups/marLo-handson/providers/Microsoft.Compute/virtualMachines/vm",
  "location": "eastus",
  "macAddress": "AA-BB-CC-DD-EE-FF",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.4",
  "publicIpAddress": "123.456.78.910",
  "resourceGroup": "marLo-handson",
  "zones": ""
}
```
Please do not care some slight differences. All you need is the `publicIpAddress` of the created VM.

### 5. SSH to the VM

```
$ ssh [IP OF THE VM]
```
Please replace `[IP OF THE VM]` with your IP address you can find in the result of the previous step.

### 6. Create a Conda environment for MarLo

On the VM,
```
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
$ sudo apt-get update
```

```
$ conda create python=3.6 --name marlo \
&& conda config --add channels conda-forge \
&& conda activate marlo \
&& conda install -c crowdai malmo matplotlib ipython numpy scipy \
&& pip install git+https://github.com/crowdAI/marLo.git \
&& pip install chainer==5.0.0 cupy-cuda92==5.0.0 chainerrl==0.4.0
```

### 7. Install X2Go client

Just follow the instruction here: [Installing the Qt-based X2Go Client](https://wiki.x2go.org/doku.php/doc:installation:x2goclient). Please note that you only needs the "client". You do not have to setup the X2Go server on the VM. It has already been ready to go!

After the installation of X2Go, just launch the client and connect to the VM by following this instruction: [Installing and configuring X2Go client](https://docs.microsoft.com/azure/machine-learning/data-science-virtual-machine/linux-dsvm-intro#installing-and-configuring-x2go-client).

You will see the Ubuntu desktop in the X2Go client window.

### 8. Start a Minecraft client

In the X2Go window, launch a Terminal Emulater from the left top "Applications" menu, and just run the command below to start a Minecraft client!
```
$ source activate marlo \
&& $MALMO_MINECRAFT_ROOT/launchClient.sh -port 10000
```