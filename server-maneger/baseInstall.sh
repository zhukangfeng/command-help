#!/bin/sh
echo '----Begin to run baseInstall.sh----'
echo '----install docker----'
echo '----remove installed docker----'
sudo apt-get remove docker docker-engine docker.io containerd runc
echo '----update source----'
sudo apt-get update
echo '----install https ca curl and others----'
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
echo '----Add Docker’s official GPG key:----'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo '----install docker----'
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo '----install docker-compose----'
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
