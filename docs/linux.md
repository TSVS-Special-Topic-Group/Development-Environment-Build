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
