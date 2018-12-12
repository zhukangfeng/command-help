# use nginx to get anyport of specific url

## set proxy domain
`vim /etc/hosts`

add record `127.0.0.1 proxy.local`
## add nginx conf
`vim /etch/nginx/site-availiable/proxy`

add record
```nginx conf
server {
        server_name proxy.local;
        # server_name "~^(?P<fwd_port>\d+)\.proxy\.local";
        location ~ ^/([\d]+)/(?<fwd_path>.*)$ {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                resolver 8.8.8.8;
                add_header Access-Control-Allow-Origin "*";
                proxy_pass http://127.0.0.1:$1/$fwd_path$is_args$args;
                proxy_redirect off;
                access_log on;
        }

}
```
## enable proxy conf
` ln -s /etc/nginx/site-enabled/proxy /etc/nginx/site-enabled/proxy`
## start service
` service nginx start`
