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

## 測試Hello World
```
docker run hello-world
```

## 忽略重新安裝更新
遇到無法解除安裝後重新安裝的套件時，加上`--ignore-installed`參數更新。

```
sudo python3 -m pip install -r requirements.txt --upgrade --ignore-installed
```
