# 安裝docker
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get update -y
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y
apt-cache madison docker-ce

# 設定一般權限
groupadd docker
usermod -aG docker $USER
newgrp docker
docker run hello-world

# docker開機自動啟動
systemctl enable docker

# 測試Hello World
docker run hello-world
