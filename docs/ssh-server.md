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

### 範例設定檔

```config
# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Include /etc/ssh/sshd_config.d/*.conf

Port 2022
AddressFamily any
ListenAddress 0.0.0.0
ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
PermitRootLogin no
StrictModes yes
MaxAuthTries 10
#MaxSessions 10

# PubkeyAuthentication yes

# Expect .ssh/authorized_keys2 to be disregarded by default in future.
AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes
RhostsAuthentication no
ChallengeResponseAuthentication no

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication yes
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
KbdInteractiveAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the KbdInteractiveAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via KbdInteractiveAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and KbdInteractiveAuthentication to 'no'.
UsePAM yes

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
#PermitTTY yes
PrintMotd no
#PrintLastLog yes
#TCPKeepAlive yes
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#UseDNS no
#PidFile /run/sshd.pid
MaxStartups 10
DenyUsers root
DenyGroups root
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

# override default of no subsystems
Subsystem	sftp	/usr/lib/openssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
#	X11Forwarding no
#	AllowTcpForwarding no
#	PermitTTY no
#	ForceCommand cvs server
```

## SSH Tunneling

使用SSH建立隧道，以連線區域網路所需要使用的協定，類似虛擬區域網路(VPN)。

```bash
ssh -R 0.0.0.0:9090:localhost:8080 johnliu@external-server
```

## 設定不輸入密碼登入

通過 `ssh username@hostname -p port` 登入，在 `~/.ssh/` 建立以下檔案。

```bash
ssh-keygen -t ed25519 -C "commit"
```

使用 `scp` 複製檔案到遠端伺服器。

```bash
scp ~/.ssh/id_rsa.pub username@hostname:~
```

然後再次使用 `ssh username@hostname -p port` 連線。進入後，將檔案重新命名成 `authorized_keys` ，但要看你在 `sshd_config` 中設定什麼名稱，預設為 `authorized_keys` 和 `authorized_keys2` 。

```bash

```

### 安全操作

由於有些伺服器沒有 `.ssh` 資料夾與相關權限，因此會需要在家目錄建立 `.ssh` 資料夾，建議可以使用 `ls -ld .ssh` 與 `ls -l .ssh` 查閱相關權限，理論上 `.ssh` 資料夾應該要 `700` ； `*.pub` 檔案應該要 `644` ； `private_key` 應該要 `600` 。

可以使用 `chmod` 進行改動權限設定。

```bash
chmod 700 .ssh
chmod 644 .ssh/authorized_keys
```

## References

- SSH tunneling
    - https://johnliu55.tw/ssh-tunnel.html