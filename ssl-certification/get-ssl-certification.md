# ssl-certification
## 背景
之前介绍了利用letsencryt源代码进行网站https加密服务（详细请看之前的文章）。  
在使用过程中，我的服务器不知道是什么原因出现了错误。  
提示pip版本太低，但是升级后还是无法解决，而letsencrypt生成的证书有效期都是90天的，  
90天后证书失效，所以在失效之前需要进行新的证书生成。

这里就给介绍一个更加简单的方法。

直接登录免费在线ssl证书生成网站[sslforfree](https://www.sslforfree.com/)根据要求生成证明书，然后上传到服务器即可。  

## 详细操作指南
查看我的个人博客 [zhuk.tk](https://zhuk.tk/2016/07/11/create-ssl-certificate/)

## 主要简单步骤：
###  git clone https://github.com/certbot/certbot.git
### 安装证书 ./certbot-auto --apache -d zhuk.tk
### 定时更新证书 
vim /etc/crontab
// 添加下面一行内容
···
# renew letsencrypt cert every month
0       2       1       *       *       root    /path/to/certbot/certbot-auto renew --force-renew
···
