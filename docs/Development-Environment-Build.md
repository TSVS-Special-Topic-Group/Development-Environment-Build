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
