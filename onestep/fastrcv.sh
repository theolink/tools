#!/bin/sh
cd
git clone https://github.com/theolink/rtklib.git
cd rtklib/app/rtkrcv/gcc
make
sudo cp rtkrcv /usr/local/bin/rtkrcv
sudo chmod +x /usr/local/bin/rtkrcv
sudo mkdir /etc/rtk/
sudo mkdir /etc/rtk/log/
sudo mkdir /etc/rtk/cmd/
sudo chmod -R 777 /etc/rtk
cd /etc/rtk/cmd/
wget
cd /etc/rtk/
wget
wget
sudo chmod +x /etc/rtk/rcvinit.sh
sudo touch /etc/rtk/log/rcvinit.log
sudo chmod 777 /etc/rtk/log/rcvinit.log
sed -i '16i\/etc/rtk/rcvinit.sh\n' /etc/rc.local