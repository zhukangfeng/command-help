# docker 学习记录以及相关操作命令记录
<!-- TOC -->
- [docker 安装](#docker-安装)
- [docker-compose 安装](#docker-compose-安装)
- [docker 学习记录以及相关操作命令记录](#docker-学习记录以及相关操作命令记录)
    - [常用命令](#常用命令)
        - [删除关闭了的container](#删除关闭了的container)
        - [删除无用的image](#删除无用的image)
        - [docker进入container](#docker进入container)
        - [获取container最近日志](#获取container最近日志)
        - [将container持久化为image](#将container持久化为image)

<!-- /TOC -->
## docker 安装
[https://docs.docker.com/install/](https://docs.docker.com/install/)
### ubuntu
[https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
```shell
# remove old version
sudo apt-get remove docker docker-engine docker.io containerd runc
# update repostory
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# GPG key checking
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# add x86_64/amd64 install repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# install engine-community
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# check install status
sudo docker run hello-world

```
## docker-compose 安装
[https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
```shell
# linux
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

```

## 常用命令
### 删除关闭了的container
```
docker rm $(docker ps -aq)
```
### 删除无用的image
```
docker rmi $(docker images | grep none | awk '{print $3}')
```
### docker进入container
```
docker exec -it docker-name bash
```

### 获取container最近日志
```
docker logs -f --tail 10 container_name
```
### 将container持久化为image
```
docker commit container_id
docker tag image_id image_name
```
