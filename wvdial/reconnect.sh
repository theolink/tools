#!/bin/sh
echo "`date`: Network detecting--------------------------------"  >> /etc/wvdial/reconnect.log
server="www.baidu.com"
#当前ttyUSB号，与wvdial.conf中相同
ttyUSB="ttyUSB0"
while true
do
    ping -c 1 $server
    if [ $? -ne 0 ]
    then
        echo "`date`: Connect failed, reconnect.." >> /etc/wvdial/reconnect.log
        while true
        do
            if [ -e "/dev/${ttyUSB}" ];then
               break
            else
                echo "`date`: Wait for ${ttyUSB}" >> /etc/wvdial/reconnect.log
                sleep 1
            fi
        done
        wvdial MF832REG
        sleep 1
        wvdial MF832DATAON
    else
        echo "`date`: Connect ok" >> /etc/wvdial/reconnect.log
        break
    fi
done
exit 0