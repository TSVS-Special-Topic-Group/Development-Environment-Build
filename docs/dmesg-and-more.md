# 相關維護指令

## 指令知識

```bash
username@hostname:path<$|#>
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

timmy@timmy-Latitude-E5550:~$ echo "hi" > /dev/pts/14
timmy@timmy-Latitude-E5550:~$ echo "hi\lf" > /dev/pts/14
timmy@timmy-Latitude-E5550:~$ echo "hi hi" > /dev/pts/14
timmy@timmy-Latitude-E5550:~$ 



