# mysql 主从服务器配置


## mysql docker 获取
````
docker pull mysql
````

## mysql 主从服务器内部网络创建
````
docker network create -d bridge mysql
````

## mysql 主服务器配置文件修改
### 创建映射保存目录
````
mkdir -p /var/docker/mysql/master
````
### 创建 master 主服务器配置项 /var/docker/mysql/master/my.cnf
````
[mysqld]
server_id = 1
log-bin= mysql-bin
read-only=0

# 如果只限定某些数据库同步则配置
# binlog-do-db=backupdb1
# binlog-do-db=backupdb2

# 不同步数据库的配置
replicate-ignore-db=mysql
replicate-ignore-db=sys
replicate-ignore-db=information_schema
replicate-ignore-db=performance_schema

!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/
````
### 启动 master docker
````
docker run --name mysql-master -d -p 3307:3306 \
-e MYSQL_ROOT_PASSWORD=password \
-v /var/docker/mysql/master/data:/var/lib/mysql \
-v /var/docker/mysql/master/my.cnf:/etc/mysql/my.cnf \
--network=mysql mysql
````

## slaver 从服务器配置
### 创建映射保存目录
````
mkdir -p /var/docker/mysql/slaver1
````
### 创建 master 主服务器配置项 /var/docker/mysql/slaver1/my.cnf
````
[mysqld]

server_id = 2
log-bin= mysql-bin
read-only=1

# 如果只限定某些数据库同步则配置
# binlog-do-db=backupdb1
# binlog-do-db=backupdb2

# 不同步数据库的配置
replicate-ignore-db=mysql
replicate-ignore-db=sys
replicate-ignore-db=information_schema
replicate-ignore-db=performance_schema

!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/

````
### 启动从服务器1
````
docker run --name mysql-slaver1 -d -p 3308:3306 \
-e MYSQL_ROOT_PASSWORD=password \
-v /var/docker/mysql/slaver1/data:/var/lib/mysql \
-v /var/docker/mysql/slaver1/my.cnf:/etc/mysql/my.cnf \
--network=mysql mysql
````

### 配置更多的从服务器
根据上面配置 slaver1 的步骤，可以创建更多的从服务器
要求新添加的从服务器的 server_id 唯一

## 主服务器创建用于同步的用户账户
````
# 登录主服务器 docker
docker exec -it mysql-master bash
# 登录mysql
mysql -uroot -p
# 输入密码
# 在mysql中创建同步账户
GRANT REPLICATION SLAVE ON *.* to 'backup'@'%' identified by 'password';
````

## 从服务器配置主服务器地址信息
````
# 登录从服务器的 docker
docker exec -it mysql-slaver1 bash
# 登录mysql
mysql -uroot -p
# 输入密码
# 修改同步主服务器的信息
change master to master_host='mysql-master',master_user='backup',master_password='password',master_log_file='mysql-bin.000001',master_log_pos=0,master_port=3306;
# 开始同步
 start slave;
 ````
 
 ## 其他命令
 ````
 # master 主服务器状态查看
 SHOW MASTER STATUS \G;
 # slaver 从服务器状态查看
 SHOW SLAVE STATUS \G;
 ````
