#!/bin/sh
apt-get install wvdial -y
cd /etc/
wget https://raw.githubusercontent.com/theolink/tools/master/wvdial/wvdial.conf
mkdir /etc/wvdial/
cd /etc/wvdial/
wget https://raw.githubusercontent.com/theolink/tools/master/wvdial/wvdial.sh
chmod +x /etc/wvdial/wvdial.sh
sudo touch /etc/wvdial/dial.log
sudo chmod 777 /etc/wvdial/dial.log
sed  -i '1c #!/bin/sh' /etc/rc.local
sed -i '15i\/etc/wvdial/wvdial.sh\n' /etc/rc.local
wget https://raw.githubusercontent.com/theolink/tools/master/wvdial/reconnect.sh
chmod +x /etc/wvdial/reconnect.sh
sudo touch /etc/wvdial/reconnect.log
sudo chmod 777 /etc/wvdial/reconnect.log
