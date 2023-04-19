#!/bin/bash

echo "instalando LXD"
sudo apt-get -y install lxd
sudo newgrp lxd
sudo lxd init --auto
sudo lxc launch ubuntu:20.04 web
sudo lxc exec web -- apt-get update
sudo lxc exec web -- apt-get -y install apache2
sudo lxc file push /var/www/html/index.html web/var/www/html/index.html
var=$( ifconfig eth1 | grep inet | awk 'NR==1 {print $2 }')
sudo lxc config device add web myport80 proxy listen=tcp:"$var":5080 connect=tcp:127.0.0.1:80