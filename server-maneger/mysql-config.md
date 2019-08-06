# config mysql
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
