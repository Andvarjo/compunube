#!/bin/bash
echo "Instalando Python 3"
sudo apt-get update
sudo apt -y install python3-pip
echo "python 3 instalado"
echo "Instalando Jupyter Notebook"
yes | pip3  install jupyter
export PATH="$HOME/.local/bin:$PATH"
echo "jupyter instalado"
echo "Instalando net tools"
sudo apt-get -y install net-tools
echo "Instalando vim"
sudo apt-get -y install vim