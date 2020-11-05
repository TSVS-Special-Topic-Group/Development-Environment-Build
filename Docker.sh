# 安裝docker
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y -f
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y -f
sudo apt-cache madison docker-ce -y

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl enable docker

docker run hello-world
