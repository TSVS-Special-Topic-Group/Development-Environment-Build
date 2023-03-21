# Linux開機流程

## 系統載入流程

開機時，會先載入 BIOS ，會讀取開機磁區，也就是 MBR 或者 GPT 。

經由這個設定，BIOS 檢查完後會將權限轉給 UEFI ， UEFI 則會將開機轉交給「開機讀取程式」(bootloader)，新版的在 `systemd` ，舊版在 `init` 。

使用 `pstree` 實際資料夾為以下：

```bash
systemd─┬─NetworkManager───2*[{NetworkManager}]
        ├─accounts-daemon───2*[{accounts-daemon}]
        ├─acpid
        ├─avahi-daemon───avahi-daemon
        ├─bluetoothd
        ├─colord───2*[{colord}]
        ├─containerd───9*[{containerd}]
        ├─cron
        ├─cups-browsed───2*[{cups-browsed}]
        ├─cupsd───dbus
        ├─dbus-daemon
        ├─dnsmasq───dnsmasq
        ├─dockerd───26*[{dockerd}]
        ├─fwupd───4*[{fwupd}]
        ├─gdm3─┬─gdm-session-wor─┬─gdm-wayland-ses─┬─gnome-session-b───2*[{gnom+
        │      │                 │                 └─2*[{gdm-wayland-ses}]
        │      │                 └─2*[{gdm-session-wor}]
        │      └─2*[{gdm3}]
        ├─gnome-keyring-d─┬─ssh-agent
        │                 └─3*[{gnome-keyring-d}]
        ├─irqbalance───{irqbalance}
        ├─2*[kerneloops]
        ├─libvirtd───20*[{libvirtd}]
        ├─networkd-dispat
        ├─packagekitd───2*[{packagekitd}]
        ├─polkitd───2*[{polkitd}]
        ├─postgres───6*[postgres]
        ├─power-profiles-───2*[{power-profiles-}]
        ├─qemu-system-x86───69*[{qemu-system-x86}]
        ├─rsyslogd───3*[{rsyslogd}]
        ├─rtkit-daemon───2*[{rtkit-daemon}]
        ├─snapd───14*[{snapd}]
        ├─sshd
        ├─sshguard─┬─sshg-blocker───{sshg-blocker}
        │          ├─sshg-fw-nft-set
        │          ├─sshguard───journalctl
        │          └─sshguard───sshg-parser
        ├─switcheroo-cont───2*[{switcheroo-cont}]
        ├─systemd─┬─(sd-pam)
        │         ├─Telegram─┬─sh───pxgsettings───3*[{pxgsettings}]
        │         │          └─42*[{Telegram}]
        │         ├─WD-TabNine───16*[{WD-TabNine}]
        │         ├─at-spi2-registr───2*[{at-spi2-registr}]
        │         ├─atom───atom─┬─atom───atom───14*[{atom}]
        │         │             ├─atom───atom
        │         │             ├─atom───5*[{atom}]
        │         │             ├─atom───21*[{atom}]
        │         │             ├─atom───10*[{atom}]
        │         │             └─32*[{atom}]
        │         ├─4*[bash]
        │         ├─bwrap───xdg-dbus-proxy───{xdg-dbus-proxy}
        │         ├─2*[chrome_crashpad───2*[{chrome_crashpad}]]
        │         ├─chrome_crashpad───{chrome_crashpad}
        │         ├─dbus-daemon
        │         ├─dconf-service───2*[{dconf-service}]
        │         ├─eog───5*[{eog}]
        │         ├─evolution-addre───5*[{evolution-addre}]
        │         ├─evolution-calen───8*[{evolution-calen}]
        │         ├─evolution-sourc───3*[{evolution-sourc}]
        │         ├─flatpak-portal─┬─bwrap
        │         │                └─2*[{flatpak-portal}]
        │         ├─flatpak-session───2*[{flatpak-session}]
        │         ├─2*[gjs───6*[{gjs}]]
        │         ├─3*[gnome-calculato───3*[{gnome-calculato}]]
        │         ├─gnome-calendar───5*[{gnome-calendar}]
        │         ├─gnome-session-b─┬─at-spi-bus-laun─┬─dbus-daemon
        │         │                 │                 └─3*[{at-spi-bus-laun}]
        │         │                 ├─evolution-alarm───5*[{evolution-alarm}]
        │         │                 ├─gsd-disk-utilit───2*[{gsd-disk-utilit}]
        │         │                 ├─pentablet.sh───pentablet───6*[{pentablet}+
        │         │                 ├─update-notifier───3*[{update-notifier}]
        │         │                 └─3*[{gnome-session-b}]
        │         ├─gnome-session-c───{gnome-session-c}
        │         ├─gnome-shell─┬─Xwayland───6*[{Xwayland}]
        │         │             ├─bwrap───bwrap─┬─bwrap───obsidian
        │         │             │               └─obsidian.sh───obsidian─┬─2*[c+
        │         │             │                                        ├─obsi+
        │         │             │                                        ├─obsi+
        │         │             │                                        ├─obsi+
        │         │             │                                        ├─zypa+
        │         │             │                                        └─25*[+
        │         │             ├─chrome─┬─2*[cat]
        │         │             │        ├─chrome───chrome───22*[{chrome}]
        │         │             │        ├─chrome─┬─chrome─┬─chrome───5*[{chrom+
        │         │             │        │        │        ├─10*[chrome───7*[{c+
        │         │             │        │        │        ├─chrome───8*[{chrom+
        │         │             │        │        │        ├─chrome───10*[{chro+
        │         │             │        │        │        ├─chrome───21*[{chro+
        │         │             │        │        │        └─chrome───6*[{chrom+
        │         │             │        │        └─nacl_helper
        │         │             │        ├─2*[chrome───8*[{chrome}]]
        │         │             │        └─24*[{chrome}]
        │         │             ├─code─┬─code───code───16*[{code}]
        │         │             │      ├─code───code───code───14*[{code}]
        │         │             │      ├─code───5*[{code}]
        │         │             │      ├─code─┬─code─┬─6*[bash]
        │         │             │      │      │      └─17*[{code}]
        │         │             │      │      ├─code───13*[{code}]
        │         │             │      │      └─16*[{code}]
        │         │             │      ├─code─┬─TabNine─┬─TabNine─┬─TabNine-dee+
        │         │             │      │      │         │         └─80*[{TabNin+
        │         │             │      │      │         └─19*[{TabNine}]
        │         │             │      │      ├─3*[code───11*[{code}]]
        │         │             │      │      ├─code───8*[{code}]
        │         │             │      │      └─14*[{code}]
        │         │             │      └─31*[{code}]
        │         │             ├─gjs───7*[{gjs}]
        │         │             ├─gnome-control-c───8*[{gnome-control-c}]
        │         │             ├─gnome-system-mo───3*[{gnome-system-mo}]
        │         │             └─20*[{gnome-shell}]
        │         ├─gnome-shell-cal───5*[{gnome-shell-cal}]
        │         ├─2*[gnome-terminal───gnome-terminal.───3*[{gnome-terminal.}]+
        │         ├─gnome-terminal-─┬─14*[bash]
        │         │                 ├─bash───pstree
        │         │                 └─3*[{gnome-terminal-}]
        │         ├─goa-daemon───3*[{goa-daemon}]
        │         ├─goa-identity-se───2*[{goa-identity-se}]
        │         ├─gsd-a11y-settin───3*[{gsd-a11y-settin}]
        │         ├─gsd-color───3*[{gsd-color}]
        │         ├─gsd-datetime───3*[{gsd-datetime}]
        │         ├─gsd-housekeepin───3*[{gsd-housekeepin}]
        │         ├─gsd-keyboard───3*[{gsd-keyboard}]
        │         ├─gsd-media-keys───4*[{gsd-media-keys}]
        │         ├─gsd-power───4*[{gsd-power}]
        │         ├─gsd-print-notif───2*[{gsd-print-notif}]
        │         ├─gsd-printer───2*[{gsd-printer}]
        │         ├─gsd-rfkill───2*[{gsd-rfkill}]
        │         ├─gsd-screensaver───2*[{gsd-screensaver}]
        │         ├─gsd-sharing───3*[{gsd-sharing}]
        │         ├─gsd-smartcard───3*[{gsd-smartcard}]
        │         ├─gsd-sound───3*[{gsd-sound}]
        │         ├─gsd-wacom───3*[{gsd-wacom}]
        │         ├─gsd-xsettings───7*[{gsd-xsettings}]
        │         ├─gvfs-afc-volume───3*[{gvfs-afc-volume}]
        │         ├─gvfs-goa-volume───2*[{gvfs-goa-volume}]
        │         ├─gvfs-gphoto2-vo───2*[{gvfs-gphoto2-vo}]
        │         ├─gvfs-mtp-volume───2*[{gvfs-mtp-volume}]
        │         ├─gvfs-udisks2-vo───3*[{gvfs-udisks2-vo}]
        │         ├─gvfsd─┬─gvfsd-dnssd───2*[{gvfsd-dnssd}]
        │         │       ├─gvfsd-http───2*[{gvfsd-http}]
        │         │       ├─gvfsd-network───3*[{gvfsd-network}]
        │         │       ├─gvfsd-recent───2*[{gvfsd-recent}]
        │         │       ├─gvfsd-trash───2*[{gvfsd-trash}]
        │         │       └─2*[{gvfsd}]
        │         ├─gvfsd-fuse───5*[{gvfsd-fuse}]
        │         ├─gvfsd-metadata───2*[{gvfsd-metadata}]
        │         ├─ibus-portal───2*[{ibus-portal}]
        │         ├─ibus-x11───2*[{ibus-x11}]
        │         ├─nautilus───4*[{nautilus}]
        │         ├─obexd
        │         ├─p11-kit-server───p11-kit-remote
        │         ├─pipewire───{pipewire}
        │         ├─pipewire-media-───{pipewire-media-}
        │         ├─pulseaudio───3*[{pulseaudio}]
        │         ├─pxgsettings───3*[{pxgsettings}]
        │         ├─seahorse───3*[{seahorse}]
        │         ├─sh───ibus-daemon─┬─ibus-engine-arr───2*[{ibus-engine-arr}]
        │         │                  ├─ibus-engine-che───3*[{ibus-engine-che}]
        │         │                  ├─ibus-engine-lib───3*[{ibus-engine-lib}]
        │         │                  ├─ibus-engine-sim───2*[{ibus-engine-sim}]
        │         │                  ├─ibus-extension-───3*[{ibus-extension-}]
        │         │                  ├─ibus-memconf───2*[{ibus-memconf}]
        │         │                  └─2*[{ibus-daemon}]
        │         ├─snap-store───4*[{snap-store}]
        │         ├─snapd-desktop-i───snapd-desktop-i───3*[{snapd-desktop-i}]
        │         ├─tracker-miner-f───5*[{tracker-miner-f}]
        │         ├─virt-manager───8*[{virt-manager}]
        │         ├─xdg-desktop-por───6*[{xdg-desktop-por}]
        │         ├─xdg-desktop-por───3*[{xdg-desktop-por}]
        │         ├─xdg-desktop-por───8*[{xdg-desktop-por}]
        │         ├─xdg-document-po─┬─fusermount3
        │         │                 └─9*[{xdg-document-po}]
        │         └─xdg-permission-───2*[{xdg-permission-}]
        ├─systemd-journal
        ├─systemd-logind
        ├─systemd-machine
        ├─systemd-oomd
        ├─systemd-resolve
        ├─systemd-timesyn───{systemd-timesyn}
        ├─systemd-udevd
        ├─teamviewerd───16*[{teamviewerd}]
        ├─thermald───{thermald}
        ├─udisksd───4*[{udisksd}]
        ├─unattended-upgr───{unattended-upgr}
        ├─upowerd───2*[{upowerd}]
        ├─virtlogd
        └─wpa_supplicant
```

接下來會交給 GRUB 系統啟動軟體，會執行將相關硬碟進行掛載，依照設定檔依序掛載硬碟與目錄，接下來進行開機。

另外，通常 GRUB 可以修復硬碟、更改密碼、修復作業系統、更換開機順序等，有點算是 Windows 修復工具。

## Init啟動模式

|  |  |
|--|--|
|  |  |
|  |  |
