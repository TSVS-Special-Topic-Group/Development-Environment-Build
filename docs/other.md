# 其他 Linux

## Atom套件權限設定

```bash
chown -R $USER:$USER ~/.atom
```

## Docker

### 設定一般權限

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

### docker開機自動啟動

```bash
sudo systemctl enable docker
```

### 切換docker群組身份

```bash
newgrp docker
```

### 測試Hello World

```bash
docker run hello-world
```

## Python 特殊問題

### 忽略重新安裝更新

遇到無法解除安裝後重新安裝的套件時，加上`--ignore-installed`參數更新。

```bash
sudo python3 -m pip install -r requirements.txt --upgrade --ignore-installed
```

### 手動執行Docker執行GitLab CI腳本內容

啟動Docker執行Python容器

```shell
docker pull python:latest
docker run -it -d --name docker-devlop-venv-build python:latest
```

進入容器

```shell
docker exec -it docker-devlop-venv-build bash
```

執行以下指令：

```shell
git clone https://github.com/TSVS-Special-Topic-Group/Development-Environment-Build.git
cd Development-Environment-Build
python -V  # Print out python version for debugging
```

安裝Python相依C/C++程式：

```shell
# 更新
apt update -y
apt upgrade -y

# 相關Python環境
apt install git ffmpeg libxss1 xdg-utils cmake valgrind cppcheck build-essential iverilog verilator ghdl graphviz graphviz-dev protobuf-compiler libprotoc-dev python-gpg libgpgme-dev v4l2loopback-dkms -y -f

# 無關Python內容
apt install kdenlive gimp obs-studio libreoffice flatpak -y -f
apt install atom -y -f
```

安裝Python相關套件：

```shell
pip install pip --upgrade
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt --upgrade
exit
```

離開容器

```shell
docker stop docker-devlop-venv-build
docker rm docker-devlop-venv-build
```

## PDF 操作

### 使用 qpdf 解密 PDF

```bash
qpdf --decrypt input.pdf output.pdf
```

### 加密 PDF

#### 使用 qpdf

使用 AES 255 bit encrypt 加密 DPF 。

```bash
qpdf --encrypt <user-password>:<owner-password> 256 --modify-other=n --modify=none --print=none -- somefile.pdf somefile_encrypted.pdf
```

| 參數                    | 說明                                     |
| ----------------------- | ---------------------------------------- |
| `--accessibility=[y|n]` | restrict accessibility (usually ignored) |
| `--annotate=[y|n]`      | restrict commenting/filling form fields  |
| `--assemble=[y|n]`      | restrict document assembly               |
| `--extract=[y|n]`       | restrict text/graphic extraction         |
| `--form=[y|n]`          | restrict filling form fields             |
| `--modify-other=[y|n]`  | restrict other modifications             |
| --modify=modify-opt     | control modify access by level           |
| --print=print-opt       | control printing access                  |
| --cleartext-metadata    | prevent encryption of metadata           |

在經過三個小時的測試與奮戰，終於將問題找出來，原來 `--use-aes=y` 的選項是用在 128 bit AES 加密上面，所以如果在 256 bit 上使用 128 bit AES 的話會有嚴重的錯誤，這個指令在 10.6~11.3 都是一樣的，可惜在網路上的資料很多都是將 256 bit AES 也是加上 `--use-aes=y` ，以至於造成花很多時間找資料與找問題。

由於很多參數還不是很清楚要做什麼，因此目前就只有使用 `--modify-other=n` 、 `--modify=none` 、 `--print=none` 參數。

#### 使用 pdftk

如果使用 pdftk 針對檔案進行加密，使用以下指令：

```bash
pdftk somefile.pdf output somefile_encrypted.pdf encrypt_128bit owner_pw owner_password user_pw user_password
```

`encrypt_128bit` 是加密的長度與難度，另可以選擇 `encrypt_40bit` ，就目前了解只有支援到 128 bit 加密長度。

`owner_pw` 擁有者密碼用於修改功能。

`user_pw` 使用者密碼用於檢視功能。

## 參考資料

- PDF
    - [Install PDF2OCR - Convert Images/Pdf into Text on Ubuntu](https://snapcraft.io/install/pdf2go/ubuntu)
    - [GitHub pdf2go](https://github.com/jamalmazrui/pdf2ocr)
    - [pdfunite PDF merging utility. More information](https://command-not-found.com/pdfunite)
    - [How to install qpdf on Ubuntu](https://howtoinstall.co/package/qpdf)
    - [QPDF](https://qpdf.sourceforge.io/)
    - [How to install Ghostscript on Ubuntu 16.04](https://www.linuxhelp.com/how-to-install-ghostscript-on-ubuntu-16-04)
    - [How do I install 'convert' on a linux system?](https://serverfault.com/questions/194795/how-do-i-install-convert-on-a-linux-system)
    - [pdfunite - Portable Document Format (PDF) page merger](https://manpages.ubuntu.com/manpages/trusty/man1/pdfunite.1.html)
    - [QPDF MkDocs](https://qpdf.readthedocs.io/)
    - [pdftk：於 Linux 移除 PDF 密碼](https://blog.longwin.com.tw/2023/05/pdftk-linux-remove-pdf-password-2023/)
    - [Setting a Password on a PDF File in Linux](https://www.baeldung.com/linux/file-pdf-set-password)
    - [Merge PDF Files in Bash](https://www.baeldung.com/linux/merge-pdf-files#qpdf)
    - [How to set password for pdf files?](https://unix.stackexchange.com/questions/187404/how-to-set-password-for-pdf-files)
    - [PDF Labs PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
    - [PDF 解鎖的好工具 – QPDF](https://www.mxp.tw/69/)
