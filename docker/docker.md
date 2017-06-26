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
