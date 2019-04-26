#!/bin/sh
#当前wvdial.conf中的网卡串口值，保持和wvdial.conf中相同
old_device="ttyUSB0"
#此脚本中检测出来网卡串口值，每次脚本运行结束时将old_device设置为和device相同
device="ttyUSB0"

#检测是否存在网卡
getTTY(){
    base="/sys/bus/usb/devices/"
    if [ -d $base ];then
        for file in $(ls $base)
        do
            if [ -e ${base}${file}/interface ];then
                #若interface中的值为USB-AT，代表当前串口接收AT指令，即为网卡串口
                if [ $(cat ${base}${file}/interface) = "USB-AT" ];then
                    echo "`date`: USB-AT is found" >> /etc/wvdial/dial.log
                    device=$(ls ${base}${file} |grep ttyUSB )
                    while [ -z "${device}" ]
                    do
                        echo "`date`: ttyUSB is empty, try again.." >> /etc/wvdial/dial.log
                        device=$(ls ${base}${file} |grep ttyUSB)
                    done
                    echo "`date`:ttyUSB is ${device}" >> /etc/wvdial/dial.log
                    return 0
                fi
            fi
        done
    fi
    return 1
}

#注册网卡
reg(){
    while true
    do
        reg_result=`wvdial MF832REG 2>&1`
        reg=`echo ${reg_result} | grep "Modem initialized"`
        if [ "${reg}" != "" ];then
            echo "`date`: Dial reg OK !" >> /etc/wvdial/dial.log
            break
        else
            echo "`date`: Dial reg failed, sleep 2s and retry.." >> /etc/wvdial/dial.log
            sleep 2
        fi
    done
}

#激活网卡
dataOn(){
    while true
    do
        dataon_result=`wvdial MF832DATAON 2>&1`
        dataon=`echo ${dataon_result} | grep "Modem initialized"`
        if [ "${dataon}" != "" ];then
            echo "`date`: Dial data on OK !" >> /etc/wvdial/dial.log
            break
		else
            echo "`date`: Dial data on failed, sleep 2s and retry.." >> /etc/wvdial/dial.log
            sleep 2
        fi
    done
}

#检测直到网卡挂载
while true
do
    echo "`date`: Try to find ttyUSB.." > /etc/wvdial/dial.log
    getTTY
    if [ $? = 0 ];then
        break
    fi
    echo "`date`: ttyUSB not found, wait 1s.." >> /etc/wvdial/dial.log
    sleep 1
done


#修改网卡串口号
if [ ${old_device} != ${device} ];then
    echo "`date`: Change USB Modem from ${old_device} to ${device}" >> /etc/wvdial/dial.log
    cd /etc/
    find -name 'wvdial.conf' | xargs perl -pi -e "s|${old_device}|${device}|g"
    find -name 'wvdial.sh' | xargs perl -pi -e "s|${old_device}|${device}|g"
    find -name 'reconnect.sh' | xargs perl -pi -e "s|${old_device}|${device}|g"
fi
echo "`date`: Dialing.." >> /etc/wvdial/dial.log

reg
sleep 2
dataOn

echo "`date`: Finish dial" >> /etc/wvdial/dial.log

exit 0