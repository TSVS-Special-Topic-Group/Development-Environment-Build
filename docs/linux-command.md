# 相關維護指令

## 指令知識

```bash
username@hostname:path<$|#>
```

## 修改執行顯示前綽

```bash
PS1="\u@\h [$(date +%k:%M:%S)]> "
```

## 開機資訊指令

當開機有問題時，可以使用 `dmesg` 查閱系統相關資訊，例如硬碟、驅動程式等，使用以下功能：

```bash
dmesg | more
```

## 網路相關指令

### 查閱網路連線

Ubuntu 需要安裝 `net-tools` 。

```bash
sudo apt install net-tools
```

查閱網路伺服器。

```bash
netstat -tunlp | grep 80
```

`0.0.0.0` 開放所有界面與IP連線進入。

## 查閱系統資訊

顯示完整資訊：

```bash
uname -a
```

顯示Linux核心：

```bash
uname -r
```

## 傳訊息給不同使用者的終端機

`/dev/pts/` 是所有使用的終端機畫面，每個有不同的編號，因此如果知道是誰的就可以直接傳訊息給對方。

```
echo "hi" > /dev/pts/0
```

這個時候另一個終端機會出現以下訊息：

```bash
timmy@timmy-Latitude-E5550:~/arduino-ide$ hi

```
