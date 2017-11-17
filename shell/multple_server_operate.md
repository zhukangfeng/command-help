```

#!/bin/bash

SERVER='1,2,3,4,5,6,7,8'
command='pwd'
path='~'
while getopts "h?c:s:p:" opt; do
    case "$opt" in
        s)
            SERVER=$OPTARG
            ;;
        c)
            command=$OPTARG
            ;;
        p)
            path=$OPTARG
            ;;
    esac  
done      
echo $path
for i in ${SERVER//,/ };
do   
    url="$i.zhukangfeng.tk"
    echo $url
    ssh "zhukangfeng@$url" "cd $path && $command";
done  
```
