# 翻墙为了学术，远离其他目的
## 背景
众所周知，中国国家防火墙（GFW）将大陆和外面的世界加了一堵墙。  
平时想要通过google搜索一些学术资料，没有翻墙技巧是无法实现的。 
很多时候github也无法正常访问，所以“翻墙”技术对于软件开发者来说，  
是一门非常必须的技能。如果都不会“翻墙”，都不好意思说自己是搞计算机相关工作的。  
这里就介绍一下如何使用sockt实现“翻墙”功能。  

## 多方式安装
多种代理快速安装：[proxysu](https://github.com/proxysu/windows)

## 实现原理
通过连接远程linux服务器的ss服务，实现本地浏览器“翻墙”。  
需要的软硬件条件：  
* 架设在国外的服务器，可以是购买的ss服务，或者在自己的vps、docker镜像等服务上架设ss服务。  
  具体如何架设ss服务器，或者docker ss服务容器，之后有时间再写。
* 下载本地ss客户端。这里采用了shadowsocks，可以在网上搜索，  
  或者在本工程文件中下载[shadowsocks](https://raw.githubusercontent.com/zhukangfeng/command-help/master/Shadowsocks.exe)。
  
  
  相关git
  [against_gfw](https://github.com/zhukangfeng/against_gfw.git)


## 利用ssh隧道创建代理
```sh
ssh -qtfnN  -D 127.0.0.1:1080 root@server.url
```

## 多用户docker安装Trojan
### 按照命令
```shell
docker run --name trojan-mariadb --restart=always -p 3306:3306 -v /home/mariadb:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=trojan -e MYSQL_ROOT_HOST=% -e MYSQL_DATABASE=trojan -d mariadb:10.2
docker run -it -d --name trojan --net=host --restart=always --privileged jrohy/trojan init
```
### 命令行
```
Usage:
  trojan [flags]
  trojan [command]

Available Commands:
  add           添加用户
  clean         清空指定用户流量
  completion    自动命令补全(支持bash和zsh)
  del           删除用户
  help          Help about any command
  info          用户信息列表
  log           查看trojan日志
  restart       重启trojan
  start         启动trojan
  status        查看trojan状态
  stop          停止trojan
  tls           证书安装
  update        更新trojan
  updateWeb     更新trojan管理程序
  version       显示版本号
  import [path] 导入sql文件
  export [path] 导出sql文件
  web           以web方式启动

Flags:
  -h, --help   help for trojan
```
### 其他帮助
[Jrohy/trojan](https://github.com/Jrohy/trojan)

## Trojan
- https://github.com/trojan-gfw/trojan/releases
- https://www.atrandys.com/2019/1963.html

### ssh server
### 进入 root
``` sh
sudo su
```
### 安装 Trojan
```sh
curl -O https://raw.githubusercontent.com/atrandys/trojan/master/trojan_mult.sh && chmod +x trojan_mult.sh && ./trojan_mult.sh
```
需要输入对应域名

### 安装bbr加速
```sh
cd /usr/src && wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
```
### trojan服务端怎么修改密码
- trojan服务端配置文件路径 `/usr/src/trojan/server.conf` ，如需修改内容，修改以下文件即可。
- 修改完成后，重启trojan服务端 `systemctl restart trojan` 即可，同时客户端的密码也要同步修改哦。
### 客户端下载
- [trojan official site](https://github.com/trojan-gfw/trojan/releases)
- [trojan mac app site](https://github.com/JimLee1996/TrojanX)

## v2ray
### install
```sh
bash <(curl -L -s https://install.direct/go.sh)
```
### auto start
```sh
systemctl enable v2ray
```
