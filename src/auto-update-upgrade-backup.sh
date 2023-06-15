cd ~/Git/backup
git pull
helm repo add gitlab https://charts.gitlab.io
docker exec -t gitlab gitlab-backup create  # 在更新前先進行備份

docker stop gitlab gitlab-runner
docker rm gitlab gitlab-runner
helm delete gitlab-runner -n gitlab
minikube stop
minikube delete

sudo apt-get update
sudo apt-get upgrade -y
flatpak update -y
sudo ddclient -daemon=0 -debug -verbose -noquiet
# sudo dpkg -i minikube_*.deb
docker pull gitlab/gitlab-ce:latest
docker pull gitlab/gitlab-runner:latest

docker run --cpus=6 --cpuset-cpus 0-5 -d --publish 80:80 --publish 443:443 --publish 22:22 --publish 25:25 --publish 465:465 --publish 587:587 --name gitlab --restart always --volume /var/lib/gitlab/config/:/etc/gitlab --volume /var/lib/gitlab/logs/:/var/log/gitlab --volume /var/lib/gitlab/data/:/var/opt/gitlab gitlab/gitlab-ce:15.7.8-ce.0
# docker run --cpus=1 --publish 80:80 --name -it -d atca python:latest
docker run -d --name gitlab-runner --restart always -v /var/lib/gitlab-runner/:/etc/gitlab-runner/ -v /var/lib/gitlab-runner/certs/gitlab.atcatw.org.crt:/etc/gitlab-runner/certs/gitlab.atcatw.org.crt -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest
# gitlab-runner register --name gitlab-atcatw-org --url https://gitlab.atcatw.org --registration-token xxxxxxxxxxxxx

minikube start --cpus 6 --force --driver=podman
kubectl create namespace gitlab
helm repo update
helm install --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm install --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
