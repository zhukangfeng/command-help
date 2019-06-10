# docker 学习记录以及相关操作命令记录
<!-- TOC -->

- [docker 学习记录以及相关操作命令记录](#docker-学习记录以及相关操作命令记录)
    - [常用命令](#常用命令)
        - [删除关闭了的container](#删除关闭了的container)
        - [删除无用的image](#删除无用的image)
        - [docker 进入container](#docker-进入container)

<!-- /TOC -->
## 常用命令
### 删除关闭了的container
```
docker rm $(docker ps -a | awk '{print $1}')
```
### 删除无用的image
```
docker rmi $(docker images | grep none | awk '{print $3}')
```
### docker 进入container
```
docker exec -it docker-name bash
```

### 获取 docker container 最近日志
```
docker logs -f --tail 10 container_name
```
