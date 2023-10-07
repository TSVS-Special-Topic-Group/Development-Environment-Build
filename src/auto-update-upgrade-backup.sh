cd ~/Git/backup
git pull

docker exec -t gitlab rm -rf /var/lib/gitlab/data/backups/db
docker exec -t gitlab rm -rf /var/lib/gitlab/data/backups/repositories
docker exec -t gitlab rm /opt/gitlab/embedded/service/gitlab-rails/tmp/backup_restore.pid
docker exec -t gitlab gitlab-backup create  # 在更新前先進行備份
# sudo rsync -e 'ssh -p 2023' -arvhz --progress --delete /var/lib/gitlab/data/backups/ timmy@nas.atcatw.org:/mnt/NAS/backup/gitlab/  # 異地備援
# sudo rsync -e 'ssh -p 2023' -arvhi --progress --delete --partial --append /var/lib/gitlab/ atca@docker.system.org:/var/lib/gitlab/

helm repo add gitlab https://charts.gitlab.io
helm repo add traefik https://traefik.github.io/charts
helm repo add filestash https://sebagarayco.github.io/helm-filestash
helm search repo filestash

docker stop gitlab
docker rm gitlab
helm delete gitlab-runner -n gitlab
minikube stop
minikube delete


sudo apt-get update
sudo apt-get upgrade -y
# flatpak update -y
# sudo ddclient -daemon=0 -debug -verbose -noquiet
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
docker pull gitlab/gitlab-ce:latest

docker run --cpus=6 --cpuset-cpus 0-5 -d \
    --publish 80:80 \
    --publish 443:443 \
    --publish 22:22 \
    --publish 25:25 \
    --publish 465:465 \
    --publish 587:587 \
    --name gitlab \
    --restart always \
    --volume /var/lib/gitlab/config/:/etc/gitlab \
    --volume /var/lib/gitlab/logs/:/var/log/gitlab \
    --volume /var/lib/gitlab/data/:/var/opt/gitlab \
    gitlab/gitlab-ce:latest

# export HTTP_PROXY=http://10.0.0.3:3128
# export HTTPS_PROXY=https://<proxy hostname:port>
# export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24,10.0.0.0/24,10.1.1.0/24,10.2.2.0/24,50.0.0.0/24

minikube start --cpus 6 --driver=kvm2
helm repo update

kubectl create namespace gitlab
# helm install --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm install --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
# helm upgrade --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner

#helm search repo filestash
# install
#helm install filestash filestash/filestash \
#  --namespace='filestash' --create-namespace \

# kubectl create ns traefik-v2
# Install in the namespace "traefik-v2"
# helm install --namespace=traefik-v2 \
#     traefik traefik/traefik

# docker compose -f ispyagentdvr-docker-compose.yaml up -d --remove-orphans
