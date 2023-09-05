# apt-get安裝
# ==========
# 系統更新與升級
sudo apt update
sudo apt upgrade -y

# 加入安裝來源
# =============
# Kdenlive
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
# Atom
# sudo sh -c 'wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -'
# sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

# AnyDesk
sudo sh -c 'wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -'
sudo sh -c 'echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list'

# OBS
sudo add-apt-repository ppa:obsproject/obs-studio -y
# inkscape
sudo add-apt-repository ppa:inkscape.dev/stable -y
# Lutris
sudo add-apt-repository ppa:lutris-team/lutris -y
# playonlinux
# sudo sh -c 'wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -'
# sudo sh -c 'wget http://deb.playonlinux.com/playonlinux_stretch.list -O /etc/apt/sources.list.d/playonlinux.list'
# Wine
sudo dpkg --add-architecture i386 
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/kinetic/winehq-kinetic.sources
# 電源管理
sudo add-apt-repository ppa:slimbook/slimbook -y

sudo apt install apt-file -y -f
sudo apt-file update
sudo apt list --upgradable
sudo apt-get update -y

# C 語言
sudo apt-get install cmake make clang -y -f # 編譯、環境建置
sudo apt-get install valgrind -y -f  # 動態檢查
sudo apt-get install cppcheck -y -f  # 靜態檢查
sudo apt-get install infer astyle uncrustify clang-format -y -f  # 風格化
sudo apt-get install check -y -f  # 程式程式
sudo apt install build-essential -y -f

# Python
sudo apt-get install python3 python3-dev python3-pip python3-all-dev -y -f
sudo apt-get install git ffmpeg libxss1 xdg-utils -y -f
sudo apt-get install graphviz graphviz-dev -y -f
sudo apt install python3-gpg libgpgme-dev -y -f
sudo apt-get install protobuf-compiler libprotoc-dev -y -f
sudo apt-get install python3-pyaudio portaudio19-dev -y -f
sudo apt-get install build-essential swig libpulse-dev libasound2-dev  -y -f
sudo apt-get install zlib1g-dev libbz2-dev liblzma-dev libboost-all-dev -y -f
sudo apt install libxslt1-dev -y -f
sudo apt-get install g++ libyaml-dev libmp3lame0 libavcodec-extra-* -y -f
sudo apt-get install libpq-dev  postgresql postgresql-contrib -y -f # pgsql
sudo apt-get install -y -f \
    libopencv-core-dev \
    libopencv-highgui-dev \
    libopencv-calib3d-dev \
    libopencv-features2d-dev \
    libopencv-imgproc-dev \
    libopencv-video-dev
sudo apt install espeak -y -f
sudo apt install libespeak-dev -y -f
sudo apt-get install python3-tk -y -f

# Podman
sudo apt-get install podman -y -f

# QEMU
sudo apt install qemu qemu-utils qemu-kvm -y -f
sudo apt install libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y -f
sudo apt install sshguard openssh-server mosh -y -f
sudo apt install seabios ovmf hugepages -y -f
sudo apt install cpu-checker -y -f
sudo apt install spice-vdagent -y -f
kvm-ok
sudo grep -c vmx /proc/cpuinfo
sudo grep -c svm /proc/cpuinfo
# sudo systemctl status libvirtd.service
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

# Wine
sudo apt install --install-recommends winehq-stable -y -f

# SQL
sudo apt-get install sqlitebrowser -y -f

# R
# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr -y -f
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
sudo sh -c 'wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc'
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" -y
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y

sudo apt-get install libatlas3-base -y -f
sudo apt-get install libopenblas-base -y -f
sudo apt-get install r-base r-base-dev -y -f

# playonlinux
sudo apt-get install playonlinux -y -f

# HDL
sudo apt install iverilog verilator ghdl -y -f
sudo apt-get install libtinfo5 -f -y

# DDNS
sudo apt-get install libio-socket-ssl-perl -y -f
sudo apt-get install ddclient -y -f

# 給 OBS 使用
sudo apt install v4l2loopback-dkms -y -f

# Lutris
sudo apt install lutris -y -f

sudo apt-get install obs-studio -y -f
# sudo apt-get install kdenlive gimp -y -f
# sudo apt-get install atom -y -f

# Libreoffice
sudo apt-get install libreoffice libreoffice-common -y -f

# ImageMagick
sudo apt install libtiff-dev libpng-dev -y -f
sudo apt install imagemagick -y -f

# Java
sudo apt install openjdk-17-jre-headless openjdk-17-jre -y -f
sudo apt install libxrender1 libxtst6 libxi6 libxext6 -y -f

# exFat NTFS 檔案
sudo apt install exfat-fuse exfatprogs -y -f

# Fonts
sudo apt install fonts-noto-cjk fonts-noto -y -f
sudo apt install fonts-arphic-ukai fonts-arphic-uming -y -f
sudo apt install fonts-noto -y -f

# Apple
sudo apt install cmake clang bison flex libfuse-dev libudev-dev pkg-config libc6-dev-i386 \
    linux-headers-generic gcc-multilib libcairo2-dev libgl1-mesa-dev libglu1-mesa-dev libtiff5-dev \
    libfreetype6-dev git git-lfs libelf-dev libxml2-dev libegl1-mesa-dev libfontconfig1-dev libbsd-dev \
    libxrandr-dev libxcursor-dev libgif-dev libavutil-dev libpulse-dev libavformat-dev libavcodec-dev \
    libswresample-dev libdbus-1-dev libxkbfile-dev libssl-dev -y -f

# Array 3.0
sudo apt install ibus-array -y -f

# 給 Flatpak 使用
sudo apt-get install flatpak -y -f

# Snap
sudo apt install snapd -y -f
sudo snap install snap-store

# 來源更新
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Flatpak安裝
# flatpak install flathub io.atom.Atom --system -y
flatpak install flathub com.axosoft.GitKraken --system -y
flatpak install flathub com.spotify.Client --system -y
flatpak install flathub org.gimp.GIMP --system -y
flatpak install flathub org.kde.kdenlive --system -y
flatpak install flathub com.rawtherapee.RawTherapee --system -y
flatpak install flathub com.obsproject.Studio --system -y
flatpak install flathub org.darktable.Darktable --system -y
flatpak install flathub org.videolan.VLC --system -y
# flatpak install flathub org.libreoffice.LibreOffice --system -y
# flatpak install flathub org.telegram.desktop --system -y
flatpak install flathub com.usebottles.bottles --system -y
flatpak install flathub org.blender.Blender --system -y
flatpak install flathub com.github.muriloventuroso.pdftricks --system -y
# flatpak install flathub md.obsidian.Obsidian --system -y
flatpak install flathub org.kde.krita --system -y
flatpak install flathub org.inkscape.Inkscape --system -y

# 數學軟體
sudo apt-get install sagemath -y -f
flatpak install flathub org.scilab.Scilab --system -y
flatpak install flathub org.octave.Octave --system -y
flatpak install flathub org.geogebra.GeoGebra --system -y
flatpak install flathub io.github.veusz.Veusz --system -y
flatpak install flathub com.github.fabiocolacio.marker --system -y
sudo apt install ktikz -y -f
sudo apt install qtikz -y -f

# 圖片檢視
sudo apt install heif-gdk-pixbuf heif-thumbnailer libheif1 -y -f

# RPM
sudo apt install rpm -y -f
sudo apt install alien -y -f

# Ruby
sudo apt-get install ruby -y -f

# 觸控板
sudo apt-get install libinput-tools -y -f
sudo apt-get install ruby -y -f
sudo apt-get install xdotool -y -f
sudo gem install fusuma
sudo gem update fusuma

# Markdown
# sudo snap install mdl
sudo gem install mdl

# 安裝 SoftEther VPN
sudo apt install cmake gcc g++ make pkgconf libncurses5-dev libssl-dev libsodium-dev libreadline-dev zlib1g-dev -f -y

# Install L2TP/IPSec
sudo apt-get install network-manager-l2tp -y -f
sudo apt-get install network-manager-l2tp-gnome -y -f
sudo apt-get install network-manager-strongswan-gnome -y -f
sudo apt-get install network-manager-vpnc-gnome -y -f

# 遠端軟體 遠端桌面
sudo apt install xfce4 xfce4-goodies tightvncserver -y -f
# ufw allow 5901/tcp
sudo apt install anydesk -y -f

# 電腦效能燒機測試軟體
sudo add-apt-repository ppa:colin-king/stress-ng -y
sudo apt update
sudo apt install stress-ng -y -f

# 溫度監控
sudo apt install lm-sensors -y -f
# sudo sensors-detect
# sensors

# 電源管理
sudo apt install tlp -y -f
sudo apt install slimbookbattery -y -f

# VScode
sudo apt install xclip -y -f

# S.M.A.R.T.
sudo apt install smartmontools -y -f
sudo apt install xfsprogs zfsutils-linux btrfs-progs f2fs-tools exfat-fuse exfatprogs udftools -y -f

# 更新
sudo apt-file update
sudo apt update
sudo apt list --upgradable
sudo apt upgrade -y -f
flatpak update -y

# 安裝 Kite
# wget -O kite-installer.sh https://linux.kite.com/dls/linux/current
# bash kite-installer.sh --download
# bash kite-installer.sh --install

# 安裝 slang
# git clone https://github.com/MikePopoloski/slang.git
# cd slang
# mkdir build && cd build
# cmake -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/bin ..
# make -j8
# ctest
# bin/unittests
# make install
# cd ../../

# VS code Atom Thnem
code --install-extension akamud.vscode-theme-onedark
code --install-extension ms-vscode.atom-keybindings

# VS code C/C++
code --install-extension ms-vscode.cpptools-extension-pack

# VS code Python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.python

# VS code Python 環境管理
code --install-extension donjayamanne.python-environment-manager

# VS code Python Lint
code --install-extension ms-python.pylint

# VS code Python Indent
code --install-extension KevinRose.vsc-python-indent

# VS code Python Django
code --install-extension batisteo.vscode-django
code --install-extension tht13.python
# code --install-extension formulahendry.code-runner

# VS code Python Docs
code --install-extension njpwerner.autodocstring

# VS code 排序匯入套件
code --install-extension ms-python.isort

# VS code 熱門套件擴展安裝
# code --install-extension donjayamanne.python-extension-pack

# VS code Chinese Traditional Language
code --install-extension MS-CEINTL.vscode-language-pack-zh-hant

# VS code Containers
## Dcoker
code --install-extension ms-azuretools.vscode-docker

## Containers
code --install-extension ms-vscode-remote.remote-containers

# Kubernetes
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension lunuan.kubernetes-templates
code --install-extension ipedrazas.kubernetes-snippets

# VS code Autocomplete
code --install-extension TabNine.tabnine-vscode
code --install-extension VisualStudioExptTeam.vscodeintellicode

# VS code 程式碼顏色
code --install-extension wholroyd.jinja
code --install-extension magicstack.MagicPython

# File icon
code --install-extension PKief.material-icon-theme
code --install-extension file-icons.file-icons

# VS code verilog
code --install-extension mshr-h.VerilogHDL
code --install-extension theonekevin.icarusext
code --install-extension MohammadKurjieh.verilogrunner

# VS code
code --install-extension puorc.awesome-vhdl
code --install-extension ViDE-Software.v4pvhdlforprofessionals
code --install-extension vhdlwhiz.vhdl-by-vhdlwhiz
code --install-extension rjyoung.vscode-modern-vhdl-support

# Markdown support
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension marp-team.marp-vscode
code --install-extension yzhang.markdown-all-in-one
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension mushan.vscode-paste-image
code --install-extension csholmq.excel-to-markdown-table
# code --install-extension darkriszty.markdown-table-prettify
code --install-extension TakumiI.markdowntable

# LaTeX
code --install-extension James-Yu.latex-workshop

# Python套件安裝
cd ..
python3 auto_install_python_pack.py
python3 -m ipykernel install --user

# 安裝 Dulwich
git clone https://github.com/dulwich/dulwich.git
cd dulwich/
python3 setup.py --pure install
cd ..

# 安裝 veriloggen
git clone https://github.com/PyHDI/veriloggen.git
cd veriloggen/
python3 setup.py install
cd ..

# 安裝 hardcheck
git clone https://github.com/PyHDI/hardcheck.git
cd hardcheck/
python3 setup.py install
cd ..

# 安裝 ipgen
git clone https://github.com/PyHDI/ipgen.git
cd ipgen/
python3 setup.py install
cd ..

# 安裝 PyCoRAM
git clone https://github.com/PyHDI/PyCoRAM.git
cd PyCoRAM/
python3 setup.py install
cd ..

# 安裝 mulpy
git clone https://github.com/PyHDI/mulpy.git
cd mulpy/
python3 setup.py install
cd ..

# 安裝 onnx
git clone https://github.com/onnx/onnx.git
cd onnx
git submodule update --init --recursive
python3 setup.py install
cd ..

sudo rm -rf PyCoRAM/ onnx/ PyCoRAM/ ipgen/ hardcheck/ veriloggen/ dulwich/ slang/ mulpy/
sudo apt autoremove -y
