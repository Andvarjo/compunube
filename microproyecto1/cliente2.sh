#!/bin/bash

sudo apt-get update

echo "Instalando net tools"
sudo apt-get -y install net-tools


wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo  apt install consul -y 

sudo apt -y install nodejs

sudo apt -y install npm

sudo mkdir -p consulService/app


sudo cp synced/app2.js consulService/app

cd consulService/app
sleep 1
sudo npm install consul 

sudo npm install express  
sleep 1
cd
