# Linux GRUB

## Reset Root Password

```bash
rw init=/sysroot/bin/sh
```

接下來使用 `Ctrl + X` 儲存離開。

會進入到命令內，此時可以使用以下指令：

```bash
chroot /sysroot
passwd root
touch /.autorelabel
exit
reboot
```

- [How To Reset Root Password On CentOS 7](https://www.unixmen.com/reset-root-password-centos-7/)

## Docker GRUB builder

- [docker-grub-builder](https://github.com/AmpereComputing/docker-grub-builder)