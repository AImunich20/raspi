#!/bin/bash

set -e

PYTHON_VERSION=3.10.13

echo "Update system..."
sudo apt update && sudo apt upgrade -y

echo "Install dependencies..."
sudo apt install -y \
build-essential \
checkinstall \
libssl-dev \
zlib1g-dev \
libncurses5-dev \
libncursesw5-dev \
libreadline-dev \
libsqlite3-dev \
libgdbm-dev \
libbz2-dev \
libexpat1-dev \
liblzma-dev \
libffi-dev \
uuid-dev \
tk-dev \
wget \
curl \
git

echo "Download Python $PYTHON_VERSION..."
cd /tmp
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

echo "Extract source..."
tar -xvf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION

echo "Build and install Python (this may take a while)..."
./configure --enable-optimizations
make -j$(nproc)
sudo make altinstall

echo "Setup pip..."
curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.10

echo "Upgrade pip..."
python3.10 -m pip install --upgrade pip setuptools wheel

echo "Create virtual environment..."
python3.10 -m venv ~/AI_gen

echo "Activate environment and install packages..."
source ~/AI_gen/bin/activate

pip install ultralytics flask numpy pandas matplotlib requests django jupyter

echo "Add auto-activate to ~/.bashrc..."

if ! grep -q "source ~/AI_gen/bin/activate" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# Auto activate Python env" >> ~/.bashrc
    echo "cd ~" >> ~/.bashrc
    echo "source ~/AI_gen/bin/activate" >> ~/.bashrc
fi

echo "Done"
echo "python3.10"
