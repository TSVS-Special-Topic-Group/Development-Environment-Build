# apt-get安裝
# ==========
# 系統更新與升級
apt update -y
apt upgrade -y

# 加入安裝來源
# Kdenlive
add-apt-repository ppa:kdenlive/kdenlive-stable -y
# Atom
sh -c 'wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -'
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
# OBS
add-apt-repository ppa:obsproject/obs-studio -y
# inkscape
add-apt-repository ppa:inkscape.dev/stable -y
# Lutris
add-apt-repository ppa:lutris-team/lutris -y
# playonlinux
sh -c 'wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -'
sh -c 'wget http://deb.playonlinux.com/playonlinux_cosmic.list -O /etc/apt/sources.list.d/playonlinux.list'
# 電源管理
add-apt-repository ppa:slimbook/slimbook -y

apt install apt-file -y -f
apt-file update
apt list --upgradable
apt-get update -y

# C 語言
apt-get install cmake make clang -y -f # 編譯、環境建置
apt-get install valgrind -y -f  # 動態檢查
apt-get install cppcheck -y -f  # 靜態檢查
apt-get install infer astyle uncrustify clang-format -y -f  # 風格化
apt-get install check -y -f  # 程式程式
apt install build-essential -y -f

# Python
apt-get install python3 python3-dev python3-pip python3-all-dev -y -f
apt-get install git ffmpeg libxss1 xdg-utils -y -f
apt-get install graphviz graphviz-dev -y -f
apt install python-gpg libgpgme-dev -y -f
apt-get install protobuf-compiler libprotoc-dev -y -f
apt-get install python3-pyaudio portaudio19-dev -y -f
apt-get install build-essential swig libpulse-dev libasound2-dev  -y -f
apt-get install zlib1g-dev libbz2-dev liblzma-dev libboost-all-dev -y -f
apt install libxslt1-dev -y -f
apt-get install python-virtualenv g++ libyaml-dev libav-tools libmp3lame0 libavcodec-extra-* -y -f
apt-get install libpq-dev  postgresql postgresql-contrib -y -f # pgsql
apt-get install -y -f \
    libopencv-core-dev \
    libopencv-highgui-dev \
    libopencv-calib3d-dev \
    libopencv-features2d-dev \
    libopencv-imgproc-dev \
    libopencv-video-dev
apt install espeak -y -f
apt install libespeak-dev -y -f
apt-get install python3-tk -y -f

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

# R
# update indices
apt update -qq
# install two helper packages we need
apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" -y
add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y

apt-get install libatlas3-base -y -f
apt-get install libopenblas-base -y -f
apt-get install r-base r-base-dev -y -f

# playonlinux
apt-get install playonlinux -y -f

# HDL
apt install iverilog verilator ghdl -y -f
apt-get install libtinfo5 -f -y

# DDNS
apt-get install libio-socket-ssl-perl -y -f
apt-get install ddclient -y -f

# 給 OBS 使用
apt install v4l2loopback-dkms -y -f

# Lutris
apt install lutris -y -f

# apt-get install kdenlive gimp obs-studio -y -f
apt-get install atom -y -f

# Libreoffice
apt-get install libreoffice libreoffice-common -y -f

# ImageMagick
apt install libtiff-dev libpng-dev -y -f
apt install imagemagick -y -f

# Java
apt install openjdk-17-jre-headless openjdk-17-jre -y -f
apt-get install libxrender1 libxtst6 libxi6 libxext6 -y -f

# exFat NTFS 檔案
apt install exfat-fuse exfat-utils -y -f

# Fonts
apt install fonts-noto-cjk fonts-noto -y -f
apt install fonts-arphic-ukai fonts-arphic-uming -y -f
apt install fonts-noto -y -f

# Apply
apt install cmake clang bison flex libfuse-dev libudev-dev pkg-config libc6-dev-i386 \
linux-headers-generic gcc-multilib libcairo2-dev libgl1-mesa-dev libglu1-mesa-dev libtiff5-dev \
libfreetype6-dev git git-lfs libelf-dev libxml2-dev libegl1-mesa-dev libfontconfig1-dev libbsd-dev \
libxrandr-dev libxcursor-dev libgif-dev libavutil-dev libpulse-dev libavformat-dev libavcodec-dev \
libswresample-dev libdbus-1-dev libxkbfile-dev libssl-dev -y -f

# Array 3.0
apt install ibus-array -y -f

# 給 Flatpak 使用
apt-get install flatpak -y -f

# Snap
apt install snapd -y
snap install snap-store

# Markdown
snap install mdl

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
flatpak install flathub com.spotify.Client --system -y
# flatpak install flathub org.libreoffice.LibreOffice --system -y
flatpak install flathub org.telegram.desktop --system -y
flatpak install flathub com.usebottles.bottles --system -y
flatpak install flathub org.blender.Blender --system -y
flatpak install flathub com.github.muriloventuroso.pdftricks --system -y
flatpak install flathub md.obsidian.Obsidian --system -y
flatpak install flathub org.kde.krita --system -y
flatpak install flathub org.inkscape.Inkscape --system -y

# 數學軟體
apt-get install sagemath -y -f
flatpak install flathub org.scilab.Scilab --system -y
flatpak install flathub org.octave.Octave --system -y
flatpak install flathub org.geogebra.GeoGebra --system -y
flatpak install flathub io.github.veusz.Veusz --system -y
flatpak install flathub com.github.fabiocolacio.marker --system -y
apt install ktikz -y -f
apt install qtikz -y -f

# 圖片檢視
apt install heif-gdk-pixbuf heif-thumbnailer libheif1 -y -f

# RPM
apt install rpm -y -f
apt install alien -y -f

# Ruby
apt-get install ruby -y -f

# 觸控板
apt-get install libinput-tools -y -f
apt-get install ruby -y -f
gem install fusuma -y -f
apt-get install xdotool -y -f
gem update fusuma -y -f

# 遠端軟體
apt install xfce4 xfce4-goodies tightvncserver -y -f
# ufw allow 5901/tcp

# 電源管理
apt install tlp -y -f
apt install slimbookbattery -y -f

# 更新
apt-file update
apt update -y -f
apt list --upgradable
apt upgrade -y -f
flatpak update -y
apt autoremove -y -f

# 安裝 Kite
# wget -O kite-installer.sh https://linux.kite.com/dls/linux/current
# bash kite-installer.sh --download
# bash kite-installer.sh --install

# # 安裝 slang
# git clone https://github.com/MikePopoloski/slang.git
# cd slang
# mkdir build && cd build
# cmake -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/bin ..
# make -j8
# ctest
# bin/unittests
# make install
# cd ../../

# Atom UI
apm install linter
apm install linter-ui-default
apm install intentions

# Python linter
apm install python-linters

# Python debugger
apm install python-debugger

# Atom Python 自動完成
apm install Hydrogen
apm install kite
apm install autocomplete-python

# Atom 繁體中文
apm install atom-i18n

# Atom效能檢查
apm install busy-signal

# Atom Markdown
apm install pdf-view markdown-preview-enhanced markdown-table-editor insert-timestamp markdown-image-insertion markdown-image-assistant

# Atom HDL linter
apm install linter-veriloghdl linter-vhdl

# Atom HDL language support
apm install language-verilog language-vhdl lancelot-language-hdl language-hdl

# Atom C language support
apm install linter-gcc gpp-compiler

# Atom Docker
apm install linter-docker docker language-docker

# Atom 終端機
apm install platformio-ide-terminal

# Atom 檔案圖標 小地圖 突顯
apm install file-icons minimap highlight-selected

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

rm -rf PyCoRAM/ onnx/ PyCoRAM/ ipgen/ hardcheck/ veriloggen/ dulwich/ slang/ mulpy/
