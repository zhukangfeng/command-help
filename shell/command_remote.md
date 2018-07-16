# 批量管理服务器，执行命令

```sh
servers=(server-01 server-02 server-03)

run_command() {
	server=${1}
	sshremote ${server} >> debian.log 2>&1 << remote-command
    touch a.text
    echo 'test' > a.text
    exit	

remote-command
}


for server in ${servers[@]}; do
	echo "run command in ${server}"
	run_command ${server}
done
```
