# 基础命令
// docker 编译
```
sudo docker build -t yoursave .
```

// docker 启动并且限定端口和名称
```
sudo docker run -d -p 1081:80 --name yoursave -it zhukangfeng/yoursave
```

// 进入dock容器
```
sudo docker attach 982177a902e8
```
// 获取docker contaniner ip
```
docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER_ID
```
// 进入容器也可以用 docker exec
```
docker exec -it xxxx
```

// docker开机自启动,使用--restart参数来设置：
```
docker run -m 1024m --memory-swap 1G -it -p 58080:8080 --restart=always   
--name bvrfis --volumes-from logdata mytomcat:4.0 /root/run.sh  
```
// docker开机自启动，但是创建时未指定 --restart=always ,可通过update 命令设置
```
docker update --restart=always xxx
```

# 服务器监控zabbix安装
// zabbix server 用于管理，所有被监控机都把数据发到这个主机
```
docker run --name zabbix-server-mysql -e DB_SERVER_HOST="172.17.0.1" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="xxx" -d zabbix/zabbix-server-mysql:last
```
// zabbix agent 用于被监控机器
```
docker run --name zabbix-agent -e ZBX_HOSTNAME="zabbix-agent" -e ZBX_SERVER_HOST="172.17.0.3" -d zabbix/zabbix-agent
```
// web 用于界面显示（apache版）
```
docker run --name zabbix-web-apache-mysql -e DB_SERVER_HOST="172.17.0.1" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="xxx" -e ZBX_SERVER_HOST="172.17.0.3" -e PHP_TZ="Asia/Shanghai" -d zabbix/zabbix-web-apache-mysql
```
// web 用于界面显示（nginx版）
```
docker run --name zabbix-web-nginx-mysql -e DB_SERVER_HOST="172.17.0.1" -e MYSQL_USER="zabbix" -e MYSQL_PASSWORD="xxx" -e ZBX_SERVER_HOST="172.17.0.3" -e PHP_TZ="Asia/Shanghai" -d zabbix/zabbix-web-nginx-mysql
```

// 代理安装 /etc/rc.local 文件中加入 开机自启
```
# 开启 shadowsocks
sudo docker run -d -p 8081:8081 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 8081 -k password -m aes-256-cfb
```
