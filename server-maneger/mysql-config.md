# config mysql
## install mariadb in ubuntu/debian
### install
- `sudo apt update`
- `sudo apt instal mariadb-server
### update root password
- `sudo mysql_secure_installation`
### enable remote access
- `sudo vim /etc/mysql/mariadb.conf.d/50-server.cnf`, change bind-address from `127.0.0.1` to `0.0.0.0`
- `sudo service mariadb restart` restart mysql

## ubuntu/debian first login
- username: `debian-sys-maint`
- password: show in file
```shell
cat /etc/mysql/debian.cnf
```
## add root password
```mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```


## add user
```mysql
CREATE USER 'user'@'%' IDENTIFIED BY 'pass';
```
## grant privileges
```mysql
GRANT SELECT, INSERT ON test.user TO 'user'@'%';
GRANT ALL ON *.* TO 'user'@'%';
GRANT ALL ON db_name.* TO 'user'@'%';
```
## flush privileges
```mysql
flush privileges
```
## change password
```mysql
SET PASSWORD FOR 'username'@'host' = PASSWORD('newpassword');
```

## CREATE DB
```mysql
CREATE SCHEMA `new_db` DEFAULT CHARACTER SET utf8mb4 ;
```
