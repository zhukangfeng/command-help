# install docker in ubuntu
```shell
 sudo apt-get remove docker docker-engine docker.io
 sudo apt-get update
 sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 sudo apt-key fingerprint 0EBFCD88
 sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
 sudo apt-get update
 sudo apt-get install docker-ce
 sudo docker run hello-world
```
# install docker in debian
```shell
sudo apt-get update

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
     
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
   
sudo apt-get update

sudo apt-get install docker-ce

sudo docker run hello-world
```

# install docker-composer
install by `pip`
```shell
sudo pip install docker-compose
```
install by `apt`, but not always be up to date
```shell
sudo apt-get install docker-compose
```
