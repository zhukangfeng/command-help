# 搜索相关的命令帮助

## 多文件搜索某个字符
```
find ./src/Uco/OmsBundle/ -type f -name "*.php" | xargs grep 'need found string'
```
