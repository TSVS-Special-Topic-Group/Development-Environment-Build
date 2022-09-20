# apt-get安裝
# ==========
# 系統更新與升級
sudo apt update -y
sudo apt upgrade -y

# 加入安裝來源
# Kdenlive
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
# Atom
sudo sh -c 'wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -'
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
# OBS
sudo add-apt-repository ppa:obsproject/obs-studio -y
# inkscape
sudo add-apt-repository ppa:inkscape.dev/stable -y
# Lutris
sudo add-apt-repository ppa:lutris-team/lutris -y
# playonlinux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_cosmic.list -O /etc/apt/sources.list.d/playonlinux.list
# 電源管理
sudo add-apt-repository ppa:slimbook/slimbook

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
sudo apt install python-gpg libgpgme-dev -y -f
sudo apt-get install protobuf-compiler libprotoc-dev -y -f
sudo apt-get install python3-pyaudio portaudio19-dev -y -f
sudo apt-get install build-essential swig libpulse-dev libasound2-dev  -y -f
sudo apt-get install zlib1g-dev libbz2-dev liblzma-dev libboost-all-dev -y -f
sudo apt install libxslt1-dev -y -f
sudo apt-get install python-virtualenv g++ libyaml-dev libav-tools libmp3lame0 libavcodec-extra-* -y -f
sudo apt-get install libpq-dev  postgresql postgresql-contrib -y -f # pgsql

# R
# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# Fingerprint: 298A3A825C0D65DFD57CBB651716619E084DAB9
sudo wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y

sudo apt-get install libatlas3-base -y -f
sudo apt-get install libopenblas-base -y -f
sudo apt-get install r-base r-base-dev -y -f

# playonlinux
sudo apt-get install playonlinux -y -f

# HDL
sudo apt install iverilog verilator ghdl -y -f
sudo apt-get install libtinfo5 -f -y

# 給 OBS 使用
sudo apt install v4l2loopback-dkms -y -f

# Lutris
sudo apt install lutris -y -f

# sudo apt-get install kdenlive gimp obs-studio -y -f
# sudo apt-get install libreoffice -y -f
sudo apt-get install atom -y -f

# ImageMagick
sudo apt install libtiff-dev libpng-dev -y -f
sudo apt install imagemagick -y -f

# Java
sudo apt install openjdk-17-jre-headless openjdk-17-jre -y -f
sudo apt-get install libxrender1 libxtst6 libxi6 libxext6 -y -f

# exFat NTFS 檔案
sudo apt install exfat-fuse exfat-utils -y -f

# Apply
sudo apt install cmake clang bison flex libfuse-dev libudev-dev pkg-config libc6-dev-i386 \
linux-headers-generic gcc-multilib libcairo2-dev libgl1-mesa-dev libglu1-mesa-dev libtiff5-dev \
libfreetype6-dev git git-lfs libelf-dev libxml2-dev libegl1-mesa-dev libfontconfig1-dev libbsd-dev \
libxrandr-dev libxcursor-dev libgif-dev libavutil-dev libpulse-dev libavformat-dev libavcodec-dev \
libswresample-dev libdbus-1-dev libxkbfile-dev libssl-dev -y -f

# Array 3.0
sudo apt install ibus-array -y -f

# 給 Flatpak 使用
sudo apt-get install flatpak -y -f

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
flatpak install flathub org.libreoffice.LibreOffice --system -y
flatpak install flathub org.telegram.desktop --system -y
flatpak install flathub com.usebottles.bottles --system -y
flatpak install flathub org.blender.Blender --system -y
flatpak install flathub com.github.muriloventuroso.pdftricks --system -y
flatpak install flathub md.obsidian.Obsidian --system -y
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

# 觸控板
sudo apt-get install libinput-tools -y -f
sudo apt-get install ruby -y -f
sudo gem install fusuma -y -f
sudo apt-get install xdotool -y -f
sudo gem update fusuma -y -f

# 遠端軟體
sudo apt install xfce4 xfce4-goodies tightvncserver -y -f
# sudo ufw allow 5901/tcp

# 電源管理
sudo apt install tlp -y -f
sudo apt install slimbookbattery -y -f

# 更新
sudo apt-file update
sudo apt update -y -f
sudo apt list --upgradable
sudo apt upgrade -y -f
flatpak update -y
sudo apt autoremove -y -f

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
# sudo make install
# cd ../../

# Atom UI
apm install linter
apm install linter-ui-default
apm install intentions

# Python linter
apm install python-linters

# Python debugger
apm install python-debugger

# Atom Python自動填寫
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

# Python套件安裝
cd ..
python3 -m pip install pip --upgrade --no-warn-script-location
python3 -m pip install -r requirements.txt --upgrade --no-warn-script-location
# sudo python3 -m pip install -r requirements.txt --upgrade
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
python setup.py install
