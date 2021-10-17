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

sudo apt-get update -y

# C 語言
sudo apt-get install cmake make -y -f
sudo apt-get install valgrind -y -f
sudo apt-get install cppcheck -y -f
sudo apt install build-essential -y -f

# Python
sudo apt-get install python3 python3-dev python3-pip python3-all-dev -y -f
sudo apt-get install git ffmpeg libxss1 xdg-utils -y -f
sudo apt-get install graphviz graphviz-dev -y -f
sudo apt install python-gpg libgpgme-dev -y -f
sudo apt-get install protobuf-compiler libprotoc-dev -y -f
sudo apt-get install python3-pyaudio portaudio19-dev -y -f
sudo apt-get install build-essential swig libpulse-dev libasound2-dev  -y -f
sudo apt-get install -y zlib1g-dev libbz2-dev liblzma-dev libboost-all-dev -y -f

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
# sudo apt-get install atom -y -f

# ImageMagick
sudo apt install libtiff-dev libpng-dev -y -f
sudo apt install imagemagick -y -f

# 給 Flatpak 使用
sudo apt-get install flatpak -y -f

# 來源更新
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Flatpak安裝
flatpak install flathub io.atom.Atom --system -y
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

# RPM
sudo apt install rpm -y
sudo apt install alien -y

# 更新
sudo apt upgrade -y
flatpak update
sudo apt autoremove -y

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

# Python套件安裝
cd ..
python3 -m pip install pip --upgrade --no-warn-script-location
python3 -m pip install -r requirements.txt --upgrade
sudo python3 -m pip install -r requirements.txt --upgrade

# 安裝 Dulwich
# git clone https://github.com/dulwich/dulwich.git
# cd dulwich/
# sudo python3 setup.py --pure install
# cd ..

# 安裝 veriloggen
# git clone https://github.com/PyHDI/veriloggen.git
# cd veriloggen/
# sudo python3 setup.py install
# cd ..

# 安裝 hardcheck
# git clone https://github.com/PyHDI/hardcheck.git
# cd hardcheck/
# sudo python3 setup.py install
# cd ..

# 安裝 ipgen
# git clone https://github.com/PyHDI/ipgen.git
# cd ipgen/
# sudo python3 setup.py install
# cd ..

# 安裝 PyCoRAM
# git clone https://github.com/PyHDI/PyCoRAM.git
# cd PyCoRAM/
# sudo python3 setup.py install
# cd ..

# 安裝 mulpy
# git clone https://github.com/PyHDI/mulpy.git
# cd mulpy/
# sudo python3 setup.py install
# cd ..

# 安裝 onnx
# git clone https://github.com/onnx/onnx.git
# cd onnx
# git submodule update --init --recursive
# sudo python setup.py install

# Atom UI
apm install linter
apm install linter-ui-default
apm install intentions

# Python linter
apm install python-linters

# Atom Python自動填寫
apm install Hydrogen
apm install kite
apm install autocomplete-python

# Atom 繁體中文
apm install cht-menu

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

# 終端機
apm install platformio-ide-terminal
