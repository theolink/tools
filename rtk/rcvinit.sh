#!/bin/sh
cd /etc/rtk/
rtkrcv -o /etc/rtk/rtkrcv.conf -s -d /dev/null &
sleep 2
sudo ps -ef | grep -w rtkrcv | grep -v grep | awk '{print $2}' |xargs kill -9
sleep 3
rtkrcv -o /etc/rtk/rtkrcv.conf -s -d /dev/null &
exit 0