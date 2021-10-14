# 安裝docker
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y -f
sudo sh -c 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg'
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y -f
sudo apt-get upgrade -y

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl enable docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

if docker > /dev/null
  then
    echo "You installed Docker."
    docker run hello-world
  else
    echo "You not installed Docker."
  fi
