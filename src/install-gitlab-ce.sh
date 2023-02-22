nohup noip-duc -g atca.ddns.net -u timmy61109 -p 123WwDdVv_ &

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
# sudo cp *_gitlab_backup.tar /var/lib/gitlab/data/backups/
# sudo cp <備份版本>_gitlab_backup.tar /var/lib/gitlab/data/backups
# docker exec -it gitlab bash
# chown git:git /var/opt/gitlab/backups/<備份版本>_gitlab_backup.tar
# exit
# docker exec -it <name of container> gitlab-backup restore BACKUP=<備份版本>
sudo cp gitlab.rb /var/lib/gitlab/config/
# sudo cp gitlab-secrets.json /var/lib/gitlab/config/
docker restart gitlab

# Kubectl
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo apt-get install -y apt-transport-https
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
minikube start --driver=docker
minikube config set driver docker

# Helm
sudo snap install helm --classic
helm repo add gitlab https://charts.gitlab.io
helm repo update
kubectl create namespace gitlab
helm install --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm install --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
