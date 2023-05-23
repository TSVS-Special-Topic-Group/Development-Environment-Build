# 搜尋檔案與資料

## locate

可以建立資料庫，並搜尋整個硬碟的檔案與資料目錄。

安裝 `locate` ：

```bash
sudo apt install locate -y -f
```

搜尋

## find

可以依照檔案性質去搜尋，包括名稱、改動時間、權限、使用者等，增加篩選能力與搜尋能力。

建立測試被搜尋檔案：

```bash
touch {a..d}.txt
```

基本搜尋指令：

```bash
find . -name test.txt
```

可以看到搜尋到的檔案有以下：

```bash
./.vscode/extensions/marp-team.marp-vscode-2.6.0/node_modules/tar-fs/test/fixtures/b/a/test.txt
find: ‘./.anydesk/incoming’: Permission denied
./test.txt
./Git/Learn-MATLAB/example/CH17/test.txt
./Git/Introduction-to-Programming-Using-Python/examples/test.txt
./.cache/cloud-code/installer/google-cloud-sdk/.install/.backup/platform/gsutil_py2/gslib/tests/test_data/test.txt
./.cache/cloud-code/installer/google-cloud-sdk/.install/.backup/platform/gsutil/gslib/tests/test_data/test.txt
./.cache/cloud-code/installer/google-cloud-sdk/platform/gsutil_py2/gslib/tests/test_data/test.txt
./.cache/cloud-code/installer/google-cloud-sdk/platform/gsutil/gslib/tests/test_data/test.txt
```

## 執行指令

搜尋後通常會加上要處理的事情，因此會可以加上參數 `--exec` 。

例如刪除：

```bash
find . -type f -name "*.txt" -exec rm {} \;
```
