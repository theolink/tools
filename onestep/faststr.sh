#!/bin/sh
cd
git clone https://github.com/theolink/rtklib.git
cd rtklib/app/str2str/gcc
make
sudo cp str2str /usr/local/bin/str2str
sudo chmod +x /usr/local/bin/str2str
sudo mkdir /etc/rtk/
sudo mkdir /etc/rtk/log/
sudo mkdir /etc/rtk/cmd/
sudo chmod -R 777 /etc/rtk
cd /etc/rtk/cmd/
wget https://raw.githubusercontent.com/theolink/tools/master/rtk/m8t_5hz_uart_beidou.cmd
cd /etc/rtk/
wget https://raw.githubusercontent.com/theolink/tools/master/rtk/strinit.sh
sudo chmod +x /etc/rtk/strinit.sh
sudo touch /etc/rtk/log/strinit.log
sudo chmod 777 /etc/rtk/log/strinit.log
sed -i '16i\/etc/rtk/strinit.sh\n' /etc/rc.local