#!/bin/sh
cd /usr/local/bin/
wget https://github.com/theolink/tools/raw/master/rtk/rtkrcv
chmod +x /usr/local/bin/rtkrcv
mkdir /etc/rtk/
mkdir /etc/rtk/log/
mkdir /etc/rtk/cmd/
chmod -R 777 /etc/rtk
cd /etc/rtk/cmd/
wget https://raw.githubusercontent.com/theolink/tools/master/rtk/m8t_5hz_uart_beidou.cmd
cd /etc/rtk/
wget https://raw.githubusercontent.com/theolink/tools/master/rtk/rtkrcv.conf
wget https://raw.githubusercontent.com/theolink/tools/master/rtk/rcvinit.sh
chmod +x /etc/rtk/rcvinit.sh
touch /etc/rtk/log/rcvinit.log
chmod 777 /etc/rtk/log/rcvinit.log
sed -i '16i\/etc/rtk/rcvinit.sh\n' /etc/rc.local