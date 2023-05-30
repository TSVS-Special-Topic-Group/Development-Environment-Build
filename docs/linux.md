# 檔案管理

## Inode

儲存檔案資訊的地方，

```bash
start filename
```

例如以下執行結果：

```bash
timmy@timmy-D820MT-D820SF-BM3CE:~$ stat .profile 
  File: .profile
  Size: 807       	Blocks: 8          IO Block: 4096   regular file
Device: 804h/2052d	Inode: 4980741     Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/   timmy)   Gid: ( 1000/   timmy)
Access: 2023-04-17 12:36:26.285545540 +0800
Modify: 2022-12-27 16:45:04.386666753 +0800
Change: 2022-12-27 16:45:04.386666753 +0800
 Birth: 2022-12-27 16:45:04.386666753 +0800
```

## SUID 、 SGID 、 SBIT

檔案的特殊資訊， SUID 、 SGID 、 SBIT ，三個可以完整控制權限。

### Set UID

設定有關檔案的特殊權限。

### Set GID

設定有關目錄的特殊權限。

### Sticky Bit

### 設定方式

- 4 為 SUID
- 2 為 SGID
- 1 為 SBIT

如果要設定權限，除了原本的 3 個數字外，需要開頭加上多一個，為 4 個數字。例如：

```bash
[root@study ~]# cd /tmp
[root@study tmp]# touch test                  <==建立一個測試用空檔
[root@study tmp]# chmod 4755 test; ls -l test <==加入具有 SUID 的權限
-rwsr-xr-x 1 root root 0 Jun 16 02:53 test
[root@study tmp]# chmod 6755 test; ls -l test <==加入具有 SUID/SGID 的權限
-rwsr-sr-x 1 root root 0 Jun 16 02:53 test
[root@study tmp]# chmod 1755 test; ls -l test <==加入 SBIT 的功能！
-rwxr-xr-t 1 root root 0 Jun 16 02:53 test
[root@study tmp]# chmod 7666 test; ls -l test <==具有空的 SUID/SGID 權限
-rwSrwSrwT 1 root root 0 Jun 16 02:53 test
```

# 顯示歷史指令

```bash
history
```

回傳結果

```text
...
 1119  date y%
 1120  date y%m
 1121  date y%m%
 1122  date +%Y%m%d
 1123  history 988
 1124  history
```

如果找到想要的指令，可以使用 `!` 執行曾經執行過的指令。

```bash
!1122
```

會執行下列結果：

```text
date +%Y%m%d
20230530
```

# 環境變數

以下透過環境變數代入方式可以作為檔案的變數，方法可以有 `$()` 與 ```` 。

```bash
touch $(date +%Y%m%d)
```

```bash
touch `date +%Y%m%d`
```

## 時間更新

安裝時間管理套件。

```bash
sudo apt-get install ntp ntpdate
```

時間統一有助於確定備份與更新資料，確保檔案不會被錯誤覆蓋或設定不當。

```bash
sudo ntpdate watch.stdtime.gov.tw
```

可以看到下列資訊：

```text
30 May 10:01:46 ntpdate[17893]: the NTP socket is in use, exiting
```

另外，統一時區也可以確保不同時區的電腦時間一致，例如以下是設定亞洲台北時區。

```bash
sudo timedatectl set-timezone Asia/Taipei
```

寫回去 BIOS 會需要使用 `hwclock` ，確保重新開機後可以正常執行。

```bash
sudo hwclock -w
```

## 解決服務無法連線流程

檢查設定檔案 `cat /etc/ssh/sshd_config` 檢查開放網域範圍，檢查設定檔案：

```config
...
AddressFamily any
ListenAddress 0.0.0.0
ListenAddress ::
...
```

`sudo systemctl status` 檢查 `sshd.service` 服務狀態。

```bash
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2023-05-30 09:11:25 CST; 39min ago
       Docs: man:sshd(8)
             man:sshd_config(5)
    Process: 1222 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
   Main PID: 1266 (sshd)
      Tasks: 1 (limit: 18955)
     Memory: 3.0M
        CPU: 38ms
     CGroup: /system.slice/ssh.service
             └─1266 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

 五  30 09:11:25 timmy-D820MT-D820SF-BM3CE systemd[1]: Starting OpenBSD Secure Shell server...
 五  30 09:11:25 timmy-D820MT-D820SF-BM3CE sshd[1266]: Server listening on 0.0.0.0 port 22.
 五  30 09:11:25 timmy-D820MT-D820SF-BM3CE sshd[1266]: Server listening on :: port 22.
 五  30 09:11:25 timmy-D820MT-D820SF-BM3CE systemd[1]: Started OpenBSD Secure Shell server.
```

查閱防火牆

```bash
sudo ufw status
sudo firewall-cmd --zone=public --list-all
```

使用 `sudo netstat -tunlp | grep ssh` 檢查 port 開啟與開放狀況。

```bash
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1266/sshd: /usr/sbi 
tcp6       0      0 :::22                   :::*                    LISTEN      1266/sshd: /usr/sbi 
```
