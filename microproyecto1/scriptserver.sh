#!/bin/bash
sudo apt-get update 
echo "Instalando net tools"
sudo apt-get -y install net-tools




wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
#pendiente captura ip var

sudo apt -y install consul
echo "instalado consul"
sudo apt -y install haproxy
echo "instalado haproxy"
sleep 5
sudo systemctl enable haproxy
sudo cp synced/haproxy.cfg /etc/haproxy
sleep 5
echo "copiado haproxy.cfg"
sudo systemctl start haproxy
echo "iniciado haproxy.cfg"
consul agent -server -bootstrap-expect=1 -data-dir=/tmp/consul -node=servidorUbuntu -bind=192.168.100.4 -enable-script-checks=true -config-dir=/etc/consul.d -ui -client=0.0.0.0 > /dev/null 2>&1 &
consul join 192.168.100.2
consul join 192.168.100.3
sudo systemctl restart haproxy