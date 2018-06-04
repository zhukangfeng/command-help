# docker 学习记录以及相关操作命令记录

## 常用命令
### 删除关闭了的container
```
docker rm $(docker ps -a | awk '{print $1}')
```
### 删除无用的image
```
docker rmi $(docker images | grep none | awk '{print $3}')
```
