#!/bin/bash

set -e

echo "Update system..."
sudo apt update && sudo apt upgrade -y

echo "Install dependencies..."
sudo apt install -y software-properties-common \
build-essential checkinstall \
libreadline-gplv2-dev libncursesw5-dev libssl-dev \
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
zlib1g-dev libffi-dev wget curl git

echo "Install Python 3.10..."
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3.10 python3.10-venv python3.10-dev python3.10-distutils

echo "Setup pip..."
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

echo "Set default python (optional)..."
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

echo "Upgrade pip & install basic packages..."
python3.10 -m pip install --upgrade pip setuptools wheel

echo "Create virtual environment..."
python3.10 -m venv AI_gen

echo "Activate environment and install common libs..."
source AI_gen/bin/activate

pip install ultralytics flask numpy pandas matplotlib requests django jupyter

echo "Add auto-activate to ~/.bashrc..."

if ! grep -q "source ~/AI_gen/bin/activate" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# Auto activate Python env" >> ~/.bashrc
    echo "cd ~" >> ~/.bashrc
    echo "source ~/AI_gen/bin/activate" >> ~/.bashrc
fi

echo "Reload bashrc..."
source ~/.bashrc

echo "Done"
echo ""
echo "Usage:"
echo "source ~/AI_gen/bin/activate"
echo "python --version"
