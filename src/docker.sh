# 安裝docker
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get update -y
apt-get install ca-certificates curl gnupg lsb-release -y -f
sh -c 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg'
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y -f
apt-get upgrade -y

groupadd docker
usermod -aG docker $USER

systemctl enable docker
systemctl enable docker.service
systemctl enable containerd.service

if docker > /dev/null
  then
    echo "You installed Docker."
    docker run hello-world
  else
    echo "You not installed Docker."
  fi
