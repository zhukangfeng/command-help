# 常用shell命令

## tar
### 压缩
```
 tar -cvf file.tar ./file
 tar –czf file.tar.gz ./file
```
### 解压
```
tar -xvf a.tar
tar -xzvf file.tar.gz
```

### 文件指定行输出
输出指定行，并且带上行号，并且只数据特定列
```shell
nl file | sed -n -e 1 -e 2 -e 3 | | awk '{print $1,$5}
```
