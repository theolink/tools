#!/bin/sh
cd /usr/local/bin/
sudo wget https://github.com/theolink/tools/raw/master/rtk/str2str
sudo chmod +x /usr/local/bin/str2str
mkdir /etc/rtk/
mkdir /etc/rtk/log/
mkdir /etc/rtk/cmd/
chmod -R 777 /etc/rtk
cd /etc/rtk/cmd/
wget https://raw.githubusercontent.com/theolink/tools/master/rtk/m8t_5hz_uart_beidou.cmd
cd /etc/rtk/
wget https://raw.githubusercontent.com/theolink/tools/master/rtk/strinit.sh
chmod +x /etc/rtk/strinit.sh
touch /etc/rtk/log/strinit.log
chmod 777 /etc/rtk/log/strinit.log
sed -i '16i\/etc/rtk/strinit.sh\n' /etc/rc.local