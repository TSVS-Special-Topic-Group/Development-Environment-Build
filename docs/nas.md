# NAS
架設NAS相關說明與資料整合整理。

可能會想要使用 TrueNAS 或者 OpenMediaVault 。

如果使用 TrueNAS 或者目前任何免費的 NAS 軟體，都是 OS 的形式，因此無法使 Docker 或者 Kubernetes 任何容器建立，看來會需要真實的安裝系統方式達到。

經過整理與查閱資料，發現沒有純粹的軟體安裝方式，都是以 OS 架構方式安裝提供環境使用，為了個人電腦環境使用，面對此問題個人會考慮使用為 Virtualbox 或者 QEMU 等。

看過參考影片後，決定嘗試使用也是屬於 Linux 的 QEMU 虛擬主機，希望可以帶給我隔離的好環境。

# 參考資料

- https://www.truenas.com/
- https://www.qemu.org/
- https://www.openmediavault.org/
- https://youtu.be/Kq849CpGd88
- https://techcult.com/best-free-and-open-source-nas-software/
- https://blog.user.today/10-free-truenas-note/
- https://osslab.tv/nas-software-2/
https://osslab.tv/nas-software-1/
- https://hackmd.io/@Not/TrueNasCoreInstall
- 提供 Kubernetes 使用 NAS 容量空間作為 CSI 虛擬空間技術
    - https://github.com/hpe-storage/truenas-csp
    - https://artifacthub.io/packages/helm/hpe-storage/hpe-csi-driver
