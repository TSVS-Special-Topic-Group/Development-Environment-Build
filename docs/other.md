# Atom套件權限設定

```
chown -R $USER:$USER ~/.atom
```

# Docker
## 設定一般權限
```
sudo groupadd docker
sudo usermod -aG docker $USER
```

## docker開機自動啟動
```
sudo systemctl enable docker
```

## 切換docker群組身份

```
newgrp docker
```

## 測試Hello World
```
docker run hello-world
```

## 忽略重新安裝更新
遇到無法解除安裝後重新安裝的套件時，加上`--ignore-installed`參數更新。

```
sudo python3 -m pip install -r requirements.txt --upgrade --ignore-installed
```

## 手動執行Docker執行GitLab CI腳本內容
啟動Docker執行Python容器

```shell
docker pull python:latest
docker run -it -d --name docker-devlop-venv-build python:latest
```

進入容器

```shell
docker exec -it docker-devlop-venv-build bash
```

執行以下指令：

```shell
git clone https://github.com/TSVS-Special-Topic-Group/Development-Environment-Build.git
cd Development-Environment-Build
python -V  # Print out python version for debugging
```

安裝Python相依C/C++程式：

```shell
# 更新
apt update -y
apt upgrade -y

# 相關Python環境
apt install git ffmpeg libxss1 xdg-utils cmake valgrind cppcheck build-essential iverilog verilator ghdl graphviz graphviz-dev protobuf-compiler libprotoc-dev python-gpg libgpgme-dev v4l2loopback-dkms -y -f

# 無關Python內容
apt install kdenlive gimp obs-studio libreoffice flatpak -y -f
apt install atom -y -f
```

安裝Python相關套件：

```shell
pip install pip --upgrade
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt --upgrade
exit
```

離開容器

```shell
docker stop docker-devlop-venv-build
docker rm docker-devlop-venv-build
```
