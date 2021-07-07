#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL REDIS"
echo "# description : Script para instalacao do REDIS"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"
# https://www.digitalocean.com/community/tutorials/how-to-install-redis-from-source-on-ubuntu-18-04
cd ~/
sudo apt update
sudo apt install build-essential tcl
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
cd redis-stable
make
make test
sudo make install
sudo mkdir /etc/redis
sudo cp ~/redis-stable/redis.conf /etc/redis
sudo vim /etc/redis/redis.conf
sudo cp ~/script-up-server/utils/redis/redis.service /etc/systemd/system/redis.service

sudo adduser --system --group --no-create-home redis
sudo mkdir /var/lib/redis
sudo chown redis:redis /var/lib/redis
sudo chmod 770 /var/lib/redis

sudo systemctl start redis
sudo systemctl status redis

echo "\n"