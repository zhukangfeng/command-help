# 翻墙为了学术，远离其他目的
## 背景
众所周知，中国国家防火墙（GFW）将大陆和外面的世界加了一堵墙。  
平时想要通过google搜索一些学术资料，没有翻墙技巧是无法实现的。 
很多时候github也无法正常访问，所以“翻墙”技术对于软件开发者来说，  
是一门非常必须的技能。如果都不会“翻墙”，都不好意思说自己是搞计算机相关工作的。  
这里就介绍一下如何使用sockt实现“翻墙”功能。  

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
## Trojan
https://www.atrandys.com/2019/1963.html

### ssh server
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
- trojan服务端配置文件路径`/usr/src/trojan/server.conf`，如需修改内容，修改以下文件即可。
- 修改完成后，重启trojan服务端`systemctl restart trojan`即可，同时客户端的密码也要同步修改哦。

