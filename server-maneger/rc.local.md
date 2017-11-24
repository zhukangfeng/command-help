# shadowsocks 开机启动
path: /etc/rc.local
````
sudo docker run -d -p 8097:8097 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 8097 -k password -m aes-256-cfb
````
# l2tp 开机启动 
git clone https://github.com/fcojean/l2tp-ipsec-vpn-server
````
sudo docker run --name l2tp-ipsec-vpn-server \
--env-file /path/to/git/project/l2tp-ipsec-vpn-server/vpn.env \
-p 500:500/udp \
-p 4500:4500/udp \
-v /lib/modules:/lib/modules:ro \
-d --privileged \
fcojean/l2tp-ipsec-vpn-server
````

# jenkins 开机启动
````
sudo docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home/:/var/jenkins_home jenkins/jenkins &
````

