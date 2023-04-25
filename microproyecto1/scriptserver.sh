#!/bin/bash
sudo apt-get update 
echo "Instalando net tools"
sudo apt-get -y install net-tools




wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
#pendiente captura ip var

sudo apt update && sudo apt -y install consul
echo "instalado consul"
sudo apt -y install haproxy
echo "instalado haproxy"
sleep 5
sudo systemctl enable haproxy
sudo cp synced/haproxy.cfg /etc/haproxy
sudo cp synced/503.http /etc/haproxy/errors
sleep 5
echo "copiado haproxy.cfg"
sudo systemctl start haproxy
echo "iniciado haproxy.cfg"

sudo systemctl restart haproxy