wget https://github.com/fatedier/frp/releases/download/v0.27.0/frp_0.27.0_linux_arm.tar.gz
tar -zxvf frp_0.27.0_linux_arm.tar.gz
rm frp_0.27.0_linux_arm.tar.gz
mv frp_0.27.0_linux_arm /etc/frp

echo "[common]" > /etc/frp/frpc.ini
echo "server_addr = 120.79.28.188" >> /etc/frp/frpc.ini
echo "server_port = 8900" >> /etc/frp/frpc.ini
echo "privilege_token = tiansi2019" >> /etc/frp/frpc.ini
echo "login_fail_exit = false" >> /etc/frp/frpc.ini

echo "#[ssh]" >> /etc/frp/frpc.ini
echo "#type = tcp" >> /etc/frp/frpc.ini
echo "#local_ip = 127.0.0.1" >> /etc/frp/frpc.ini
echo "#local_port = 22" >> /etc/frp/frpc.ini
echo "#远程端口根据占用情况更改" >> /etc/frp/frpc.ini
echo "#remote_port = 9900" >> /etc/frp/frpc.ini

echo "#数传" >> /etc/frp/frpc.ini
echo "#[apsync]" >> /etc/frp/frpc.ini
echo "#type = udp" >> /etc/frp/frpc.ini
echo "#local_ip = 127.0.0.1" >> /etc/frp/frpc.ini
echo "#local_port = 14550" >> /etc/frp/frpc.ini
echo "#remote_port = 8910" >> /etc/frp/frpc.ini

echo "#图传" >> /etc/frp/frpc.ini
echo "#[video_stream]" >> /etc/frp/frpc.ini
echo "#type = tcp" >> /etc/frp/frpc.ini
echo "#local_ip = 127.0.0.1" >> /etc/frp/frpc.ini
echo "#local_port = 8080" >> /etc/frp/frpc.ini
echo "#remote_port = 8909" >> /etc/frp/frpc.ini

mv /etc/frp/frpc /usr/bin/
chmod +x /usr/bin/frpc
mv /etc/frp/systemd/frpc.service /etc/systemd/system/
chmod +x /etc/systemd/system/frpc.service
systemctl daemon-reload
systemctl enable frpc.service
