# 常用shell命令
<!-- TOC -->

- [常用shell命令](#常用shell命令)
    - [`tar` 用法](#tar用法)
        - [压缩](#压缩)
        - [解压](#解压)
        - [查看](#查看)
    - [文件指定行输出](#文件指定行输出)
    - [查看子文件数量大小等](#查看子文件数量大小等)
        - [`ls`的用法](#ls的用法)
        - [`du`的用法](#du的用法)
        - [`find`大文件输出](#find大文件)
    - [`scp` 的用法](#scp的用法)
    - [`rsync` 复制文件](#rsync复制文件)
        - [ `rsync` 复制文件显示进度和速度](#rsync复制文件显示进度和速度)
        - [`rsync` 通过 `ssh` 复制远程文件](#rsync通过ssh复制远程文件)
    - [统计关键词所在行数量](#统计关键词所在行数量)
        - [按时间统计日志行数量](#按时间统计日志行数量)
<!-- /TOC -->

## tar用法
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
### 查看
```
tar -tvf a.tar
tar -tzvf file.tar.gz
```

## 文件指定行输出
输出指定行，并且带上行号，并且只数据特定列
```shell
nl file | sed -n -e 1 -e 2 -e 3 | | awk '{print $1,$5}
```

## 查看子文件数量大小等
### ls的用法
- `ls -l |grep "^-" | wc -l` 或 `find ./company -type f | wc -l`  查看某路径下所有**文件**的个数，包括子文件夹里的
- `ls -lR | grep "^d" | wc -l` 查看某路径下所有**文件夹**的个数，包括子文件夹里的。

说明：
- `ls -l` 长列表输出该目录下文件信息(注意这里的文件，不同于一般的文件，可能是目录、链接、设备文件等)
- `grep "^-"` 这里将长列表输出信息过滤一部分，只保留一般文件，如果只保留目录就是 ^d
- `wc -l` 统计输出信息的行数，因为已经过滤得只剩一般文件了，所以统计结果就是文件行数，由于一行信息对应一个文件，所以也就是文件的个数。 

### du的用法
`du` 命令用来查看目录或文件所占用磁盘空间的大小。常用选项组合为：du -sh

`du` 常用的选项：  
　　`-h`：以人类可读的方式显示  
　　`-a`：显示目录占用的磁盘空间大小，还要显示其下目录和文件占用磁盘空间的大小  
　　`-s`：显示目录占用的磁盘空间大小，不要显示其下子目录和文件占用的磁盘空间大小  
　　`-c`：显示几个目录或文件占用的磁盘空间大小，还要统计它们的总和  
　　`--apparent-size`：显示目录或文件自身的大小  
　　`-l` ：统计硬链接占用磁盘空间的大小  
　　`-L`：统计符号链接所指向的文件占用的磁盘空间大小  


`du -sh` : 查看当前目录总共占的容量。而不单独列出各子项占用的容量   
`du -lh --max-depth=1`  查看当前目录下一级子文件和子目录占用的磁盘容量。  
`du -sh * | sort -n` 统计当前文件夹(目录)大小，并按文件大小排序  
`du -sk filename` 查看指定文件大小  

### find大文件
`find . -type f -size +100M`

## scp的用法
利用 `scp` 上传文件夹
`scp -P 22 -r  ./local/folder remote-url:/home/zhukangfeng/target/folder`

## rsync复制文件
利用 `rsync` 复制文件，并显示进度、速度等
### rsync复制文件显示进度和速度
`rsync --progress /path/to/source/file /path/to/target/file`
### rsync通过ssh复制远程文件
`rsync --progress -e ssh -p 32200 username@remote.server.ip:/home/username/path/to/file ./local/path`

## 统计关键词所在行数量
比如统计 10 月份日志行数
`find . -type f -name "*.log" -print0 | xargs -0 cat | grep '\[2019-10-' | wc -l`
### 按时间统计日志行数量
```sh
d=2019-09-01

while [ "$d" != 2019-10-22 ]; do
	echo $d
	d=$(date -I -d "$d + 1 day")
	find /path/to/logs -type f -name "*.log" -print0 | xargs -0 cat | grep $d | wc -l
done
```
