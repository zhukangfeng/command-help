# set ssl cert for nginx
```conf
server {
 listen 443;
  server_name www.baidu.com;
  ssl on;
  ssl_certificate  /usr/local/nginx/conf/mitmbaidu.cer;
  ssl_certificate_key  /usr/local/nginx/conf/mitmbaidu.key;
  location / {
     proxy_pass  https://www.baidu.com/;
     proxy_set_header HOST $host;
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
 }
 ```
