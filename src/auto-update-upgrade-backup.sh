git pull
docker exec -t gitlab gitlab-backup create  # 在更新前先進行備份

docker stop gitlab
docker rm gitlab
helm delete gitlab-runner -n gitlab
minikube stop
minikube delete

sudo apt-get update
sudo apt-get upgrade -y
# sudo dpkg -i minikube_*.deb
docker pull gitlab/gitlab-ce:latest

docker run --cpus=6 --cpuset-cpus 0-6 -d --publish 443:443 --publish 80:80 --publish 22:22 --publish 25:25 --publish 465:465 --publish 587:587 --name gitlab --restart always --volume /var/lib/gitlab/config/:/etc/gitlab --volume /var/lib/gitlab/logs/:/var/log/gitlab --volume /var/lib/gitlab/data/:/var/opt/gitlab gitlab/gitlab-ce:latest
minikube start --cpus=6
kubectl create namespace gitlab
helm repo update
helm install --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm install --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
