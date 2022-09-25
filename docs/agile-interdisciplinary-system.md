敏捷跨領域系統
===
「敏捷跨領域系統」(Agile-Interdisciplinary-System)是一個透過文化、工具與實作達到不同領域可以融合與合作，此系統最先嘗試與實作將軟體開發應用在翻譯上面，未來會以此為範本持續改進並應用在不同行業。

此專案以Docker架設GitLab-CE、GitLab Runner，將持續整合、持續發佈與開發與運維結合翻譯，未來會使用Kubernetes來達到目標。其中會將建置、運作、使用與備份的過程記錄下來，除了提供離職時有人可以接手，此手冊也提供未來需要的人使用。

使用Docker架設GitLab-CE與GitLab Runner的流程與方式記錄下來，並且包括三種模式備份。

# 目錄

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

- [目錄](#目錄)
- [系統環境](#系統環境)
- [Docker](#docker)
  - [安裝Docker](#安裝docker)
  - [Docker GitLab](#docker-gitlab)
    - [使用Docker安裝GitLab](#使用docker安裝gitlab)
    - [使用Docker更新GitLab](#使用docker更新gitlab)
    - [GitLab強制導向https](#gitlab強制導向https)
    - [開啟GitLab電子郵件通知](#開啟gitlab電子郵件通知)
    - [GitLab備份與還原](#gitlab備份與還原)
      - [GitLab備份](#gitlab備份)
        - [GitLab備份前須知](#gitlab備份前須知)
        - [GitLab開始備份](#gitlab開始備份)
      - [GitLab還原](#gitlab還原)
        - [GitLab還原須知](#gitlab還原須知)
        - [GitLab進行還原](#gitlab進行還原)
      - [遺失或未備份`gitlab-secrets.json`問題](#遺失或未備份gitlab-secretsjson問題)
  - [Docker GitLab-Runner](#docker-gitlab-runner)
- [Kubernetes](#kubernetes)
  - [安裝Kubernetes](#安裝kubernetes)
  - [檢查虛擬環境](#檢查虛擬環境)
  - [安裝Kubectl](#安裝kubectl)
    - [使用`curl`下載並安裝](#使用curl下載並安裝)
    - [使用`apt-get`套件管理軟體安裝](#使用apt-get套件管理軟體安裝)
  - [安裝Minikube](#安裝minikube)
    - [使用安裝套件安裝](#使用安裝套件安裝)
    - [使用二進位檔案安裝](#使用二進位檔案安裝)
    - [使用`Homebrew`安裝Minikube](#使用homebrew安裝minikube)
    - [設定使用虛擬環境](#設定使用虛擬環境)
      - [使用Docker](#使用docker)
  - [安裝Helm](#安裝helm)
    - [使用`Homebrew`安裝Helm](#使用homebrew安裝helm)
    - [使用`snap`安裝Helm](#使用snap安裝helm)
    - [快速使用Helm](#快速使用helm)
  - [Helm GitLab](#helm-gitlab)
  - [Helm GitLab-Runner](#helm-gitlab-runner)
    - [從GitLab下載Chart安裝GitLab-Runner](#從gitlab下載chart安裝gitlab-runner)
    - [使用Helm的Chart安裝GitLab-Runner](#使用helm的chart安裝gitlab-runner)
- [Ubuntu防火牆設定](#ubuntu防火牆設定)
- [自動化備份](#自動化備份)
  - [異地備份](#異地備份)
  - [腳本](#腳本)
  - [設定排程](#設定排程)
    - [設定使用者的設定檔](#設定使用者的設定檔)
    - [設定系統的設定檔](#設定系統的設定檔)
- [參考資料](#參考資料)

<!-- /code_chunk_output -->

# 系統環境

- System:Ubuntu 18.04 LTS
- Docker:19.03.8
  - Containers: 3
    - Running: 2
    - Paused: 0
    - Stopped: 1
  - Images: 6
  - Server Version: 18.09.9
  - Storage Driver: overlay2
    - Backing Filesystem: extfs
    - Supports d_type: true
    - Native Overlay Diff: true
  - Logging Driver: json-file
  - Cgroup Driver: cgroupfs
  - Plugins:
    - Volume: local
    - Network: bridge host macvlan null overlay
    - Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
  - Swarm: inactive
  - Runtimes: runc
  - Default Runtime: runc
  - Init Binary: docker-init
  - containerd version: 7ad184331fa3e55e52b890ea95e65ba581ae3429
  - runc version: dc9208a3303feef5b3839f4323d9beb36df0a9dd
  - init version: fec3683
  - Security Options:
    - apparmor
    - seccomp
    -  Profile: default
  - Kernel Version: 4.15.0-96-generic
  - Operating System: Ubuntu 18.04.4 LTS
  - OSType: linux
  - Architecture: x86_64
  - CPUs: 4
  - Total Memory: 62.87GiB
  - Name: KNPS
  - ID: ERT3:7NFG:RV52:QLKD:MMKN:2HFW:VD3Y:5TDL:RKY2:ZGMU:WZ3G:5JXP
  - Docker Root Dir: /var/lib/docker
  - Debug Mode (client): false
  - Debug Mode (server): false
  - Registry: https://index.docker.io/v1/
  - Labels:
  - Experimental: false
  - Insecure Registries:
    - 127.0.0.0/8
  - Live Restore Enabled: false
  - Product License: Community Engine
- Kubectl
  - Client Version:
    - Major: 1
    - Minor: 18
    - GitVersion: v1.18.0
    - GitCommit: 9e991415386e4cf155a24b1da15becaa390438d8
    - GitTreeState: clean
    - BuildDate: 2020-03-25T14:58:59Z
    - GoVersion: go1.13.8
    - Compiler: gc
    - Platform: linux/amd64
  - Server Version
    - Major: 1
    - Minor: 18
    - GitVersion: v1.18.0
    - GitCommit:  9e991415386e4cf155a24b1da15becaa390438d8
    - GitTreeState: clean
    - BuildDate: 2020-03-25T14:50:46Z
    - GoVersion: go1.13.8
    - Compiler: gc
    - Platform: linux/amd64
- Minikube:
  - version: v1.9.0
  - commit: 48fefd43444d2f8852f527c78f0141b377b1e42a

# Docker
## 安裝Docker
安裝Docker

```
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get update -y
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y
apt-cache madison docker-ce
docker run hello-world
```

設定一般權限

```
groupadd docker
usermod -aG docker $USER
```

docker開機自動啟動

```
sudo systemctl enable docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

測試

```
docker run hello-world
```

安裝Nvidia GPU容器

```
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
sudo apt-get update
sudo apt-get install nvidia-container-runtime
```

測試是否可以成使用GPU，可以使用 `--gpus` 指令。

```
docker run -it --rm --gpus all ubuntu nvidia-smi
```

如果成功安裝且容器可以存取到，則會有以下資訊：

```
Sun Sep 25 05:21:03 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 510.85.02    Driver Version: 510.85.02    CUDA Version: 11.6     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  Off  | 00000000:01:00.0  On |                  N/A |
| 40%   46C    P0    45W / 175W |   1807MiB /  8192MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
```

## Docker GitLab
### 使用Docker安裝GitLab
下載最新映像檔。

```
docker pull gitlab/gitlab-ce:latest
```

使用Docker運行GitLab伺服器。

```
docker run -d --publish 443:443 --publish 80:80 --publish 22:22 --publish 25:25 --publish 465:465 --publish 587:587 --name gitlab --restart always --volume /var/lib/gitlab/config/:/etc/gitlab --volume /var/lib/gitlab/logs/:/var/log/gitlab --volume /var/lib/gitlab/data/:/var/opt/gitlab gitlab/gitlab-ce:latest
```

### 使用Docker更新GitLab
先將GitLab停止運作。

```
sudo docker stop gitlab
```

刪除Docker容器。

```
sudo docker rm gitlab
```

使用Pull更新最新的GitLab映像檔。

```
sudo docker pull gitlab/gitlab-ce:latest
```

再次運行GitLab。

```
docker run -d --publish 443:443 --publish 80:80 --publish 22:22 --publish 25:25 --publish 465:465 --publish 587:587 --name gitlab --restart always --volume /var/lib/gitlab/config/:/etc/gitlab --volume /var/lib/gitlab/logs/:/var/log/gitlab --volume /var/lib/gitlab/data/:/var/opt/gitlab gitlab/gitlab-ce:latest
```

### GitLab強制導向https
如果要將GitLab強至導向https作為瀏覽，請設定`gitlab.rb`所放置檔案的位置，如果你是使用容器的話。

請在`gitlab.rb`裡面加入這樣的行句或者找出來編輯也可以，使用的是GitLab-CE整合的Let's Encrypt的功能，可以自動產生與更新憑證。

```rb
external_url "https://gitlab.example.com"         # Must use https protocol
letsencrypt['enable'] = true                      # GitLab 10.5 and 10.6 require this option
letsencrypt['contact_emails'] = ['youremail@example.com'] # Optional
# This example renews every 7th day at 12:30
letsencrypt['auto_renew_hour'] = "12"
letsencrypt['auto_renew_minute'] = "30"
letsencrypt['auto_renew_day_of_month'] = "*/7"
letsencrypt['auto_renew'] = true
```

完成後請進入容器後執行重新啟動與更新憑證

```
gitlab-ctl reconfigure
gitlab-ctl renew-le-certs
```

### 開啟GitLab電子郵件通知
在`gitlab.rb`的Email認證修改的地方新增或修改以下內容:

```rb
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "my.email@gmail.com"
gitlab_rails['smtp_password'] = "my-gmail-password"
gitlab_rails['smtp_domain'] = "smtp.gmail.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
gitlab_rails['smtp_openssl_verify_mode'] = 'peer' # Can be: 'none', 'peer', 'client_once', 'fail_if_no_peer_cert', see http://api.rubyonrails.org/classes/ActionMailer/Base.html

gitlab_rails['gitlab_email_from'] = 'from@email.com'
gitlab_rails['gitlab_email_reply_to'] = 'reply_to@email.com'
```

設定完成後使用`docker exec -ti gitlab /bin/bash`進入伺服器容器使用`gitlab-ctl reconfigure`重新啟動GitLab伺服器。

```
@System-Product-Name:/var/lib/gitlab/config$ docker exec -ti gitlab /bin/bash
root@56714314cc19:/# gitlab-ctl reconfigure
Starting Chef Client, version 14.14.29
resolving cookbooks for run list: ["gitlab"]
...
Running handlers:
Running handlers complete
Chef Client finished, 13/764 resources updated in 09 seconds
gitlab Reconfigured!
```

重新啟動後使用`gitlab-rails console`進入gitlab命令列，以`Notify.test_email('test@email.com', 'GitLab send Email', 'GitLab send Email to test.').deliver_now`測試電子郵件是否可以正常運作。

```
root@56714314cc19:/# gitlab-rails console
--------------------------------------------------------------------------------
 GitLab:       12.8.1 (d18b43a5f5a) FOSS
 GitLab Shell: 11.0.0
 PostgreSQL:   10.12
--------------------------------------------------------------------------------
Loading production environment (Rails 6.0.2)
irb(main):001:0> Notify.test_email('test@email.com', 'GitLab send Email', 'GitLab send Email to test.').deliver_now
Notify#test_email: processed outbound mail in 0.7ms
Delivered mail 5e7447c1dc972_68003fb4ef9d39a4449f@56714314cc19.mail (2283.7ms)
Date: Fri, 20 Mar 2020 04:34:09 +0000
From: GitLab <from@email.com>
Reply-To: GitLab <reply_to@email.com>
To: test@email.com
Message-ID: <5e7447c1dc972_68003fb4ef9d39a4449f@56714314cc19.mail>
Subject: GitLab send Email
Mime-Version: 1.0
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html><body><p>GitLab send Email to test.</p></body></html>

=> #<Mail::Message:70046015810820, Multipart: false, Headers: <Date: Fri, 20 Mar 2020 04:34:09 +0000>, <From: GitLab <from@email.com>>, <Reply-To: GitLab <reply_to@email.com>>, <To: test@email.com>, <Message-ID: <5e7447c1dc972_68003fb4ef9d39a4449f@56714314cc19.mail>>, <Subject: GitLab send Email>, <Mime-Version: 1.0>, <Content-Type: text/html; charset=UTF-8>, <Content-Transfer-Encoding: 7bit>, <Auto-Submitted: auto-generated>, <X-Auto-Response-Suppress: All>>
```

成功後即可退出GitLab、容器環境。

```
irb(main):002:0> exit
root@56714314cc19:/# exit
exit
@System-Product-Name:/var/lib/gitlab/config$
```

### GitLab備份與還原
#### GitLab備份
##### GitLab備份前須知
備份GitLab系統內容，備份的內容如下:

- 資料
- Attachments
- Git repositories data
- CI/CD job output logs
- CI/CD job artifacts
- LFS objects
- Container Registry images
- GitLab Pages content

不會備份:

- 金鑰
- `/etc/gitlab/gitlab-secrets.json`:資料庫金鑰、CI/CD以及雙重驗證。
- `/etc/gitlab/gitlab.rb`:伺服器的設定檔。

##### GitLab開始備份
首先要進入到容器裡面。

```
docker exec -it gitlab bash
```

然後使用備份指令，讓系統自動備份檔案內容。

```
gitlab-backup create
```

如果不進到容器也可以直接備份，可以使用以下指令:

```
docker exec -t <container name> gitlab-backup create
```

只是後續還原時還是會需要進入到容器內部，尤其如果你在測試備份與還原時。

輸出的結果:

```
2020-04-25 09:07:04 +0000 -- Dumping database ...
Dumping PostgreSQL database gitlabhq_production ... [DONE]
2020-04-25 09:07:06 +0000 -- done
2020-04-25 09:07:06 +0000 -- Dumping repositories ...
2020-04-25 09:07:06 +0000 -- done
2020-04-25 09:07:06 +0000 -- Dumping uploads ...
2020-04-25 09:07:06 +0000 -- done
2020-04-25 09:07:06 +0000 -- Dumping builds ...
2020-04-25 09:07:06 +0000 -- done
2020-04-25 09:07:06 +0000 -- Dumping artifacts ...
2020-04-25 09:07:06 +0000 -- done
2020-04-25 09:07:06 +0000 -- Dumping pages ...
2020-04-25 09:07:06 +0000 -- done
2020-04-25 09:07:06 +0000 -- Dumping lfs objects ...
2020-04-25 09:07:06 +0000 -- done
2020-04-25 09:07:06 +0000 -- Dumping container registry images ...
2020-04-25 09:07:06 +0000 -- [DISABLED]
Creating backup archive: 1587805626_2020_04_25_12.10.1_gitlab_backup.tar ... done
Uploading backup archive to remote storage  ... skipped
Deleting tmp directories ... done
done
done
done
done
done
done
done
Deleting old backups ... skipping
Warning: Your gitlab.rb and gitlab-secrets.json files contain sensitive data
and are not included in this backup. You will need these files to restore a backup.
Please back them up manually.
Backup task is done.

```

此時到達`/var/opt/gitlab/backups`目錄底下，這裡會放置剛剛備份的檔案。

```
root@e86cceb85518:/var/opt/gitlab/backups# ll
total 696
drwx------  2 git  root   4096 Apr 25 09:07 ./
drwxr-xr-x 20 root root   4096 Apr 25 08:59 ../
-rw-------  1 git  git  174080 Apr 25 08:45 1587804312_2020_04_25_12.10.1_gitlab_backup.tar
-rw-------  1 git  git  174080 Apr 25 08:50 1587804629_2020_04_25_12.10.1_gitlab_backup.tar
-rw-------  1 git  git  174080 Apr 25 08:55 1587804927_2020_04_25_12.10.1_gitlab_backup.tar
-rw-------  1 git  git  174080 Apr 25 09:07 1587805626_2020_04_25_12.10.1_gitlab_backup.tar

```

如果是在容器內部進行還原，請到容器所存放的資料卷底下去複製出來並轉移到要還原的資料庫底下。

#### GitLab還原
##### GitLab還原須知
請確定備份的伺服器與還原的伺服器的版本要一致，如果不一致請將一方退版本後讓版本一致再進行還原。

要還原備份，您還需要還原`/etc/gitlab/gitlab-secrets.json`或`/home/git/gitlab/.secret`。裡面有資料庫加密的金鑰、CI/CD以及雙重驗證的相關資料。因此如果你無法連同這兩個一起回覆的話，開啟雙重驗證的使用者與GitLab Runner將無法使用你的伺服器。

從GitLab 12.9版本開始，如果找到了未壓縮的備份(例如:備份時使用`SKIP=tar`參數，並且未指定備份的檔案`BACKUP=<timestamp>`，則使用為壓縮的備份檔案。

依照你的需求使用以下參數來進行還原:

- `BACKUP=timestamp_of_backup`:如果放置備份檔案的目錄底下有多個備份檔案，則可以選擇並指定備份檔。
- `force=yes`:不詢問是否重新產生`authorized_keys`，並會將資料庫的資料刪除並重新製作，啟用`yes`時將重新寫入`Write to authorized_keys file`並設定與更新LDAP。

如果要還原到掛載的位置，請在還原之前先將目錄保持乾淨，否則GitLab在自動還原時會移動目錄，這將會導致錯誤與問題。

##### GitLab進行還原
在GitLab裡面，還原檔案的目錄可以在`gitlab.rb`的`gitlab_rails['backup_path']`中設定，預設值為`/var/opt/gitlab/backups/`，例如:

```
sudo cp <備份版本>_gitlab_backup.tar /var/opt/gitlab/backups/
```

由於我們在容器裡面，因此將檔案複製到指定的資料卷之後要進入到容器裡面，這樣才可以正確的執行還原任務。

還原時請確定備份與還原的系統版本都是一致的，還原的檔案請放置對應的位置，以確保還原正確。Docker對應GitLab`$GITLAB_HOME/gitlab/data/backups`:`/var/opt/gitlab/backups`，先進入GitLab:

```
sudo cp <備份版本>_gitlab_backup.tar /var/lib/gitlab/data/backups
docker exec -it gitlab bash
```

變更備份檔案的權限。

```
chown git:git /var/opt/gitlab/backups/<備份版本>_gitlab_backup.tar
```

建議還是進到容器裡面依照GitLab還原時的操作方式，因為如果直接使用官方建議指令`docker exec -it <name of container> gitlab-backup restore BACKUP=<備份版本>`常常會還原失敗。首先停用一些服務的功能，並檢查服務狀態。

```
gitlab-ctl stop unicorn
gitlab-ctl stop puma
gitlab-ctl stop sidekiq
gitlab-ctl status
```

進行還原。

```
gitlab-backup restore
```

還原稱成功後重新請動GitLab並將其他附屬服務啟動，使用GitLab內建的檢查程式檢查還原資料，此時還不能動到設定檔案與機密資料，會檢查不成功。

```
gitlab-ctl reconfigure
gitlab-ctl restart
gitlab-rake gitlab:check SANITIZE=true
```

使用`exit`退出Docker容器，接下來還原設定檔案與GitLab機密資料。

```
sudo cp gitlab.rb /var/lib/gitlab/config/
sudo cp gitlab-secrets.json /var/lib/gitlab/config/
docker restart gitlab
```

#### 遺失或未備份`gitlab-secrets.json`問題
解決還原GitLab資料時遺失或未備份`gitlab-secrets.json`時的問題，會出現，首先進入到GitLab的資料庫。

```
gitlab-rails dbconsole
```

進入到GitLab資料庫操作環境後，可以輸入以下指令來檢查資料表的欄位的資料。

```
SELECT * FROM public."ci_group_variables";
SELECT * FROM public."ci_variables";
```

接著執行以下操作來重置所有相關的金鑰，操作後所有令牌、金鑰等資料都要重新更新，以確管道正確的運作。

```
DELETE FROM ci_group_variables;
DELETE FROM ci_variables;
UPDATE projects SET runners_token = null, runners_token_encrypted = null;
UPDATE namespaces SET runners_token = null, runners_token_encrypted = null;
UPDATE application_settings SET runners_registration_token_encrypted = null;
UPDATE ci_runners SET token = null, token_encrypted = null;
UPDATE ci_builds SET token = null, token_encrypted = null;
UPDATE ci_builds SET token = null, token_encrypted = null;
TRUNCATE integrations, chat_names, issue_tracker_data, jira_tracker_data, slack_integrations, web_hooks, zentao_tracker_data, web_hook_logs;
```

## Docker GitLab-Runner
使用Docker架設GitLab Runner:

```
docker pull gitlab/gitlab-runner:latest
docker run -d --name gitlab-runner --restart always -v /var/lib/gitlab-runner/:/etc/gitlab-runner/ -v /var/lib/gitlab-runner/certs/gitlab.example.com.crt:/etc/gitlab-runner/certs/gitlab.example.com.crt -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest
```

使用`docker exec -it gitlab-runner bash`進入到容器，使用以下設定:

```
gitlab-runner register --name timewaver-translate --url https://gitlab.example.com --registration-token mzR62nG88Lb4UzJek1xH
```

然後依照參數輸入內容。

```
Runtime platform                                    arch=amd64 os=linux pid=31 revision=4c96e5ad version=12.9.0
Running in system-mode.                            

Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com/):
[https://gitlab.example.com]:
Please enter the gitlab-ci token for this runner:
[mzR62nG88Lb4UzJek1xH]:
Please enter the gitlab-ci description for this runner:
[timewaver-translate]:
Please enter the gitlab-ci tags for this runner (comma separated):

Registering runner... succeeded                     runner=mzR62nG8
Please enter the executor: kubernetes, custom, docker-ssh, parallels, docker-ssh+machine, docker+machine, docker, shell, ssh, virtualbox:
docker
Please enter the default Docker image (e.g. ruby:2.6):
python:3.7.7-buster
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!

```

遇到憑證錯誤註冊失敗的問題，依照以下流程完成:

```
SERVER=gitlab.example.com
PORT=443
CERTIFICATE=/etc/gitlab-runner/certs/${SERVER}.crt

#建立gitlab的證書路徑
sudo mkdir -p $(dirname "$CERTIFICATE")

#從server取得證書並用PEM格式儲存
openssl s_client -connect ${SERVER}:${PORT} -showcerts </dev/null 2>/dev/null | sed -e '/-----BEGIN/,/-----END/!d' | sudo tee "$CERTIFICATE" >/dev/null

#使用自訂簽證註冊
gitlab-runner register --name timewaver-translate --url https://gitlab.example.com --registration-token mzR62nG88Lb4UzJek1xH --tls-ca-file=/etc/gitlab-runner/certs/gitlab.example.com.crt
```

# Kubernetes
## 安裝Kubernetes
架設Kubernetes提供更安全的容器環境，更快速、自動化的調動服務。

## 檢查虛擬環境
使用以下指令檢查系統與硬體是否支援虛擬化環境。

```
grep -E --color 'vmx|svm' /proc/cpuinfo
```

## 安裝Kubectl
在安裝Minikube前需要先安裝Kubectl，可以使用`curl`或`apt-get`安裝。

### 使用`curl`下載並安裝
以下是在沒有權限的時候安裝方式：

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
# and then append (or prepend) ~/.local/bin to $PATH
```

如果有權限則改為以下方式：

```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

### 使用`apt-get`套件管理軟體安裝
Ubuntu可以使用`apt-get`安裝使用。

```
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo apt-get install -y apt-transport-https
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

## 安裝Minikube
安裝方式有三種，安裝包、二進制檔案與`Homebrw`。

### 使用安裝套件安裝
到Minikube的[官方連結](https://github.com/kubernetes/minikube/releases)選擇使用的系統與環境安裝，針對Ubuntr可以使用`dgkp`安裝`.deb`檔案。

### 使用二進位檔案安裝

如果不想使用安裝包安裝，可以使用

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
```

Here’s an easy way to add the Minikube executable to your path:

```
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
```

### 使用`Homebrew`安裝Minikube
請使用以下步驟安裝環境。

```
sudo apt install linuxbrew-wrapper
sudo apt-get install build-essential
brew install minikube
```

### 設定使用虛擬環境
由於Kubernetes是一個容器的管理器，因此初次使用須自行選擇使用Docker、KVM或者VirtualBox當作運行Kubernetes叢集，這裡我們選擇使用Docker。

#### 使用Docker
由於我有特別使用別的使用者作為管理，因此使用安裝Docker的方式一樣，來

使用Docker當作Kubernetes的叢集環境。

```
minikube start --driver=docker
```

使用Docker當作Kubernetes預設叢集環境。

```
minikube config set driver docker
```

## 安裝Helm
### 使用`Homebrew`安裝Helm
由於官方安裝此軟體的名稱已經改變了，需要請使用`brew install helm`作為安裝指令。

```
sudo apt install linuxbrew-wrapper
sudo apt-get install build-essential
```

安裝前請先使用`brew update`兩次後再安裝。

```
brew update
brew update
brew install helm
```

### 使用`snap`安裝Helm
由於官方安裝此軟體的名稱已經改變了，需要請使用`brew install helm`作為安裝指令。

```
sudo snap install helm --classic
```

### 快速使用Helm
Helm 3之後不需要初始化，可以直接新增遠端儲存庫`https://artifacthub.io`並命名成`stable`:

```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

可以查看安裝後的狀態。

```
helm search repo bitnami
```

應該會輸出以下資料:

```
NAME                                 	CHART VERSION	APP VERSION            	DESCRIPTION                                       
stable/acs-engine-autoscaler         	2.2.2        	2.1.1                  	DEPRECATED Scales worker nodes within agent pools
stable/aerospike                     	0.3.2        	v4.5.0.5               	A Helm chart for Aerospike in Kubernetes          
stable/airflow                       	6.5.0        	1.10.4                 	Airflow is a platform to programmatically autho...
stable/ambassador                    	5.3.1        	0.86.1                 	A Helm chart for Datawire Ambassador              
stable/anchore-engine                	1.5.0        	0.7.0                  	Anchore container analysis and policy evaluatio...
stable/apm-server                    	2.1.5        	7.0.0                  	The server receives data from the Elastic APM a...
s
...
```

接下來先更新遠端安裝來源資料庫。

```
helm repo update
```

然後才再來安裝，此時請加上`--generate-name`，請注意在安裝之前請將Kubernetes啟動，此Kubernetes套件管理軟體才可以正常運作。

```
helm install bitnami/mysql --generate-name
```

如果成功，會出現以下訊息，並且告訴你此服務的一些資訊。

```
NAME: mysql-1664023587
LAST DEPLOYED: Sat Sep 24 20:46:28 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: mysql
CHART VERSION: 9.3.4
APP VERSION: 8.0.30

** Please be patient while the chart is being deployed **

Tip:

  Watch the deployment status using the command: kubectl get pods -w --namespace default

Services:

  echo Primary: mysql-1664023587.default.svc.cluster.local:3306

Execute the following to get the administrator credentials:

  echo Username: root
  MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace default mysql-1664023587 -o jsonpath="{.data.mysql-root-password}" | base64 -d)

To connect to your database:

  1. Run a pod that you can use as a client:

      kubectl run mysql-1664023587-client --rm --tty -i --restart='Never' --image  docker.io/bitnami/mysql:8.0.30-debian-11-r15 --namespace default --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD --command -- bash

  2. To connect to primary service (read/write):

      mysql -h mysql-1664023587.default.svc.cluster.local -uroot -p"$MYSQL_ROOT_PASSWORD"

```

如果要查看下載的版本，可以透過`helm list`或`helm ls`指令查詢，查詢的結果類似於Docker。

```
NAME            	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART      	APP VERSION
mysql-1664023587	default  	1       	2022-09-24 20:46:28.911454009 +0800 CST	deployed	mysql-9.3.4	8.0.30     

```

而透過 `helm show chart bitnami/mysql` 的指令可以看出這個Chart套件內容與架構，來了解會執行什麼內容。如果要完整且全部的資訊，使用 `helm show all bitnami/mysql` 可以得到相當完整且詳細的資訊。

如果不爽哪一個軟體，可以透過`helm uninstall`，但要將前面查詢的名稱完整的貼上才能刪除，例如前面使用`helm list`或`helm ls`查詢mysql的安裝，可以看到真正名稱為`mysql-1664023587`，因此在這邊`uninstall`後面要放上`mysql-1664023587`，指令為`helm uninstall mysql-1664023587`，以下為輸出結果。

```
release "mysql-1664023587" uninstalled
```

## Helm GitLab
## Helm GitLab-Runner
### 從GitLab下載Chart安裝GitLab-Runner
從官方的GitLab下載最新[GitLab-Runner](https://gitlab.com/gitlab-org/charts/gitlab-runner.git)的Chart來安裝。

```
git clone https://gitlab.com/gitlab-org/charts/gitlab-runner.git
```

### 使用Helm的Chart安裝GitLab-Runner
使用Helm添加GitLab官方儲存庫。

```
helm repo add gitlab https://charts.gitlab.io
```

然後建立新的「名稱空間」(Namespace)。

```
kubectl create namespace gitlab
```

如果是使用自己的憑證，則需要額外設定外部憑證才可以進行。如果使用此教學的方式，則會需要進入容器內在 `/etc/gitlab-runner/certs/gitlab.example.com.crt` 找到；外部則是 `/var/lib/gitlab/config/gitlab.example.com.crt` 找到。有兩個地方需要進行設定，一個是Helm Chart；另一個是Kubectl在啟動一個空間的時候進行。

Helm Chart 部份：

```yaml
## Set the certsSecretName in order to pass custom certificates for GitLab Runner to use
## Provide resource name for a Kubernetes Secret Object in the same namespace,
## this is used to populate the /etc/gitlab-runner/certs directory
## ref: https://docs.gitlab.com/runner/configuration/tls-self-signed.html#supported-options-for-self-signed-certificates
##
certsSecretName: gitlab-atca-ddns-net-cert
```

Kubectl 部份：

```
kubectl --namespace gitlab create secret generic gitlab-example-com-cert --from-file=gitlab.example.com.crt
```

使用Helm啟動GitLab-Runner。

```
helm install --namespace gitlab gitlab-runner -f values.yaml gitlab/gitlab-runner
```

更新GitLab-Runner系統。

```
helm upgrade --namespace gitlab -f values.yaml gitlab-runner gitlab/gitlab-runner
```

停止GitLab-Runner運作。

```
helm delete gitlab-runner -n gitlab
```

# Ubuntu防火牆設定
可以先查看是否啟動防火牆。

```
sudo ufw status
```

如果沒有啟動，則啟動防火牆。

```
sudo ufw enable
```

想要關閉，則關閉防火牆。

```
sudo ufw disable
```

特定狀況充許所有連線。

```
sudo ufw default allow
```

一般來說會先拒絕所有連線。

```
sudo ufw default deny
```

可以查看一些預定Port規則來使用。

```
cat /etc/services | egrep '^ssh|^http|^email'
```

我們使用的設定：

```
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 22/tcp
sudo ufw allow 25/tcp
sudo ufw allow 465/tcp
sudo ufw allow 587/tcp
```

# 自動化備份
請先參閱 [GitLab備份與還原](#GitLab備份與還原)了解如何設定與備份GitLab，並且了解如何還原。

## 異地備份
備份至檔案伺服器。

## 腳本
用於更新、升級與備份的腳本原始碼，可以透過設定排程來讓備份更加順利與方便。

```shell
git pull
docker exec -t gitlab gitlab-backup create  # 在更新前先進行備份

docker stop gitlab
docker rm gitlab
helm delete gitlab-runner -n gitlab
minikube stop
minikube delete

sudo apt-get update
sudo apt-get upgrade -y
# sudo dpkg -i minikube_*.deb
docker pull gitlab/gitlab-ce:latest

docker run --cpus=6 --cpuset-cpus 0-6 -d --publish 443:443 --publish 80:80 --publish 22:22 --publish 25:25 --publish 465:465 --publish 587:587 --name gitlab --restart always --volume /var/lib/gitlab/config/:/etc/gitlab --volume /var/lib/gitlab/logs/:/var/log/gitlab --volume /var/lib/gitlab/data/:/var/opt/gitlab gitlab/gitlab-ce:latest
minikube start --cpus=6 --force
kubectl create namespace gitlab
helm repo update
helm install --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm install --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab gitlab-runner -f gitlab-values.yaml gitlab/gitlab-runner
helm upgrade --namespace gitlab atca-gitlab-runner -f atca-values.yaml gitlab/gitlab-runner
```

## 設定排程
請參考鳥哥的[第十六章、檔案伺服器之二： SAMBA 伺服器](http://linux.vbird.org/linux_server/0370samba.php)的 [15.3.2 系統的設定檔： /etc/crontab, /etc/cron.d/*](https://linux.vbird.org/linux_basic/centos7/0430cron.php#etc_crontab1)，查看完相關設定後，可以再自行設定想要的備份時間。

### 設定使用者的設定檔
先使用Nano開啟crontab檔案。

```
crontab -e
```

輸入公司排定的更新時間。

```
# Edit this file to introduce tasks to be run by cron.
#
...
# m h  dom mon dow   command

# GitLab-CE與GitLab Runner更新的時間
00 16 * * 0 sh /home/$USER/Git/backup/auto_update_upgrade_backup.sh
```

重新啟動

```
sudo systemctl restart cron.service
```

### 設定系統的設定檔
先使用Nano開啟crontab檔案。

```
sudo nano /etc/crontab
```

輸入公司排定的更新時間。

```shell
# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

...

# GitLab-CE與GitLab Runner更新的時間
* 5 * * 0 root sh /root/Git/backup/auto_update_upgrade_backup.sh >> /var/log/auto_update_upgrade_backup.log
```

重新啟動

```shell
sudo systemctl restart cron.service
```

# 參考資料

- Docker
  - [docker docs](https://docs.docker.com/)
  - [Install Docker Engine](https://docs.docker.com/engine/install/)
  - [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- Docker GitLab
  - [GitLab Docker images](https://docs.gitlab.com/omnibus/docker/README.html)
  - [Back up GitLab](https://docs.gitlab.com/ee/raketasks/backup_restore.html#back-up-gitlab)
  - [Restore GitLab](https://docs.gitlab.com/ee/raketasks/backup_restore.html#restore-gitlab)
- Docker GitLab-Runner
  - [Run GitLab Runner in a container](https://docs.gitlab.com/runner/install/docker.html)
  - [GitLab Runner Helm Chart](https://docs.gitlab.com/runner/install/kubernetes.html)
  - [gitlab-runner register](https://docs.gitlab.com/runner/commands/README.html#gitlab-runner-register)
  - [Registering Runners](https://docs.gitlab.com/runner/register/index.html)
  - [I’m seeing x509: certificate signed by unknown authority](https://docs.gitlab.com/runner/faq/README.html#im-seeing-x509-certificate-signed-by-unknown-authority)
  - [The self-signed certificates or custom Certification Authorities](https://docs.gitlab.com/runner/configuration/tls-self-signed.html)
  - [Gitlab-CI runner: ignore self-signed certificate](https://stackoverflow.com/questions/44458410/gitlab-ci-runner-ignore-self-signed-certificate)
  - [[Linux] GitLab Runner 證書錯誤註冊失敗 (x509: certificate signed by unknown authority)](https://ggm-coding.blogspot.com/2019/08/gitlab-runner-x509-certificate-signed.html)
- 將GitLab HTTPS
  - [Enable HTTPS](https://docs.gitlab.com/omnibus/settings/ssl.html#lets-encrypt-integration)
  - [Let's Encrypt Integration](https://docs.gitlab.com/omnibus/settings/nginx.html#enable-https)
- Email
  - [SMTP settings](https://docs.gitlab.com/omnibus/settings/smtp.html)
- Kubernetes
  - [Install and Set Up kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux)
  - [Install Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
  - [Hello Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
  - [Specifying the VM driver](https://kubernetes.io/docs/setup/learning-environment/minikube/#specifying-the-vm-driver)
  - [Driver Setup](https://minikube.sigs.k8s.io/docs/start/linux/#driver-setup)
  - [Share a Cluster with Namespaces](https://kubernetes.io/docs/tasks/administer-cluster/namespaces/)
  - [Volumes](https://kubernetes.io/docs/concepts/storage/volumes/)
  - [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
  - [Installation Guide#minikube](https://kubernetes.github.io/ingress-nginx/deploy/#minikube)
  - [Kubernetes 與 minikube 入門教學](https://blog.techbridge.cc/2018/12/01/kubernetes101-introduction-tutorial/)
  - [Kubernetes 基礎教學（一）原理介紹](https://medium.com/@C.W.Hu/kubernetes-basic-concept-tutorial-e033e3504ec0)
  - [Kubernetes - 基礎概念](https://github.com/HcwXd/kubernetes-tutorial)
  - [[Day9] k8s基礎篇（二）：Deployment、ReplicaSet、Service、Secrets](https://ithelp.ithome.com.tw/articles/10219982)
  - [The Kubernetes executor](https://docs.gitlab.com/runner/executors/kubernetes.html)
- Helm
  - [Helm](https://helm.sh/)
  - [Quickstart Guide](https://helm.sh/docs/intro/quickstart/)
  - [Using Helm](https://helm.sh/docs/intro/using_helm/)
  - [Installing Helm](https://helm.sh/docs/intro/install/)
  - [Helm Commands](https://helm.sh/docs/helm/)
  - [GitLab Runner Helm Chart](https://docs.gitlab.com/runner/install/kubernetes.html)
  - [GitLab cloud native Helm Chart](https://docs.gitlab.com/charts/)
  - [[Kubernetes] Package Manager - Helm 簡介](https://godleon.github.io/blog/Kubernetes/k8s-Helm-Introduction/)
- 自動化備份
  - [第十六章、檔案伺服器之二： SAMBA 伺服器](http://linux.vbird.org/linux_server/0370samba.php)
  - [第十五章、例行性工作排程(crontab)](https://linux.vbird.org/linux_basic/centos7/0430cron.php)
