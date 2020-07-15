#!/bin/bash
cd ~
apt update
apt upgrade -y
apt install unzip p7zip-full -y
wget https://github.com/phoenixkonsole/transcendence/releases/download/2.3/Linux.zip
unzip Linux.zip -d /usr/local/bin 
if [ ! -f telos.zip ]
then
wget https://github.com/ZenH2O/001/releases/download/Latest/telos.zip
fi
7z x telos.zip -o/root/.transcendence
chmod +x /usr/local/bin/transcendence*
cat << EOF >> /root/.transcendence/transcendence.conf
rpcuser=user`shuf -i 100000-10000000 -n 1`
rpcpassword=pass`shuf -i 100000-10000000 -n 1`
rpcallowip=127.0.0.1
rpcport=5520
listen=1
server=1
daemon=1
masternode=1
maxconnections=32
dbcache=50
maxorphantx=5
maxmempool=100
bind=:8051
externalip=
masternodeaddr=:8051
masternodeprivkey=
EOF
