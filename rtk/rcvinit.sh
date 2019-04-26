#!/bin/sh
echo "`date`: Script run..." >/etc/rtk/log/rcvinit.log
cd /etc/rtk/
rtkrcv -o /etc/rtk/rtkrcv.conf -s -d /dev/null &
sleep 5
sudo ps -ef | grep -w rtkrcv | grep -v grep | awk '{print $2}' |xargs kill -9
rtkrcv -o /etc/rtk/rtkrcv.conf -s -d /dev/null &
echo "`date`: Rtkrcv OK !" >> /etc/rtk/log/rcvinit.log
exit 0