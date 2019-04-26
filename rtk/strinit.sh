#!/bin/sh
echo "`date`: Script run..." > /etc/rtk/log/strinit.log
cd /etc/rtk/
str2str -in serial://ttyUSB0:115200:8:n:1:off#ubx -out tcpcli://47.100.171.69:8700 -c /etc/rtk/cmd/m8t_5hz_uart_beidou.cmd &
sleep 5
sudo ps -ef | grep -w str2str | grep -v grep | awk '{print $2}' |xargs kill -9
nohup str2str -in serial://ttyUSB0:115200:8:n:1:off#ubx -out tcpcli://47.100.171.69:8700 -c /etc/rtk/cmd/m8t_1hz_uart_beidou.cmd &
echo "`date`: Str2str OK !" >> /etc/rtk/log/strinit.log
exit 0