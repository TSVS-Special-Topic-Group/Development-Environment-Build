# SSH config

設定檔案路徑 `/etc/ssh/sshd_config` 。

```bash
sudo apt install sshguard openssh-server
```

```config
GatewayPorts yes
Port 22
PasswordAuthentication yes
```

重新啟動SSH伺服器跟SSH。

```bash
/etc/init.d/ssh restart
```

可以透過 `hostname` 查詢IP：

```bash
hostname -I
```

如果使用可能沒有設定成功，可以使用以下指令：

```bash
sudo systemctl status ssh
sudo systemctl enable ssh
sudo systemctl start ssh
```

## SSH Tunneling

使用SSH建立隧道，以連線區域網路所需要使用的協定，類似虛擬區域網路(VPN)。

```bash
ssh -R 0.0.0.0:9090:localhost:8080 johnliu@external-server
```

## References

- SSH tunneling
    - https://johnliu55.tw/ssh-tunnel.html