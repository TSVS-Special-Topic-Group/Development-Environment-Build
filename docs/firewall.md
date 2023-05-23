# 防火牆

## iptables

每次修改或新增規則後都需要重啟服務。

## FirewallD

動態設定防火牆，不需要重新啟動。

### 安裝 FirewallD

```bash
sudo apt install firewalld
```

### 啟動 FirewallD

### 查閱規則

```bash
firewall--cmd --get-zones
```

### 查閱 FirewallD 狀態

透過 `firewall-cmd --get-active-zones` 查閱界面清單與名稱。

```text
libvirt
  interfaces: virbr0
public
  interfaces: wlp2s0
```

### 查閱界面規則

透過 `--list-all` 參數查閱規則清單，使用 `--zone=libvirt` ，例如使用 `sudo firewall-cmd --zone=libvirt --list-all` 查詢虛擬界面 `virbr0` 。

```text
libvirt (active)
  target: ACCEPT
  icmp-block-inversion: no
  interfaces: virbr0
  sources: 
  services: dhcp dhcpv6 dns ssh tftp
  ports: 
  protocols: icmp ipv6-icmp
  forward: no
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	rule priority="32767" reject
```

可以看到 `services` 查閱結果 `dhcp` 、 `dhcpv6` 、 `dns` 、 `ssh` 、 `tftp` 。

使用 `sudo firewall-cmd --zone=public --list-all` 查閱清單。

```text
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: wlp2s0
  sources: 
  services: dhcpv6-client ssh
  ports: 
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

`services` 是指提供的服務內容，可以看到提供的服務有 `ssh` 。

### 穿透防火牆


### 新增通行規則

使用 `--add-service` 參數加入開放的 port ，指令如下 `sudo firewall-cmd --zone=public --add-service=http` 。

```text
success
```

再次透過 `sudo firewall-cmd --zone=public --list-all` 查閱，可以看到多加了 `http` 。

```text
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: wlp2s0
  sources: 
  services: dhcpv6-client http ssh
  ports: 
  protocols: 
  forward: yes
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
```

可以看到充許連線的服務。

如果新增指令服務內容，要將 `--add-port` 指定為 `通訊埠/協定` ，例如 `2222/tcp` 要使用 `sudo firewall-cmd --zone=public --add-port=2222/tcp` 。

### 刪除規則

使用 `--remove-service` 刪除服務：

```bash
sudo firewall-cmd --zone=public --remove-service=http
```

使用 `--remove-port` 刪除通訊埠：

```bash
sudo firewall-cmd --zone=public --remove-port=2222/tcp
```

### 設定為永久服務

在指令後方餐上參數 `--permanent` 。

```bash
sudo firewall-cmd --permanent --zone=public --add-port=2222/tcp
```

然後使用 `--reload` 更新防火牆設定。

```bash
sudo firewall-cmd --reload
```

### NAT 轉換

## 規則設定

## 參考資料

- https://blog.gtwang.org/linux/centos-7-firewalld-command-setup-tutorial/