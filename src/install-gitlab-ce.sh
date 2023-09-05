# nohup noip-duc -g url -u username -p password &

if docker > /dev/null
  then
    echo "You installed Docker."
  else
    echo "You not installed Docker."
    sh docker.sh
  fi


# GitLab-CE
docker run -d --publish 443:443 --publish 80:80 --publish 22:22 --publish 25:25 --publish 465:465 --publish 587:587 --name gitlab --restart always --volume /var/lib/gitlab/config/:/etc/gitlab --volume /var/lib/gitlab/logs/:/var/log/gitlab --volume /var/lib/gitlab/data/:/var/opt/gitlab gitlab/gitlab-ce:latest
docker restart gitlab

# Restore
# cp *_gitlab_backup.tar /var/lib/gitlab/data/backups/
# cp <備份版本>_gitlab_backup.tar /var/lib/gitlab/data/backups
# docker exec -it gitlab bash
# chown git:git /var/opt/gitlab/backups/<備份版本>_gitlab_backup.tar
# exit
# docker exec -it <name of container> gitlab-backup restore BACKUP=<備份版本>
# cp gitlab.rb /var/lib/gitlab/config/
# cp gitlab-secrets.json /var/lib/gitlab/config/
# docker restart gitlab

# Kubectl
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Podman
sudo apt-get -y install podman

# Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb
minikube start --cpus 6 --force --driver=podman --container-runtime=cri-o --download-only=true
minikube config set driver podman

# Helm
snap install helm --classic

# Start Use
helm repo add gitlab https://charts.gitlab.io
helm repo update
kubectl create namespace gitlab
# helm install --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
# helm install --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
# helm upgrade --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
# helm upgrade --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
