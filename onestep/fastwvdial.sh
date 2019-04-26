#!/bin/sh
apt-get install wvdial
cd /etc/
wget https://raw.githubusercontent.com/theolink/tools/master/wvdial/wvdial.conf
mkdir /etc/wvdial/
cd /etc/wvdial/
wget https://raw.githubusercontent.com/theolink/tools/master/wvdial/wvdial.sh
wget https://raw.githubusercontent.com/theolink/tools/master/wvdial/reconnect.sh
chmod +x /etc/wvdial/wvdial.sh
chmod +x /etc/wvdial/reconnect.sh
sed  -i '1c #!/bin/sh' /etc/rc.local
sed -i '15i\/etc/wvdial/wvdial.sh\n' /etc/rc.local