# Create new user
## add user
```shell
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```

## enable privileges
```shell
GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';
```

## flush privileges
```shell
FLUSH PRIVILEGES;
```
