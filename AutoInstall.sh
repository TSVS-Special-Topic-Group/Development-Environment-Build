# 系統更新與升級
sudo apt update -y
sudo apt upgrade -y

# 加入安裝來源
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" /etc/apt/sources.list.d/atom.list'
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt-get update

# apt-get安裝
sudo apt-get install python3 python3-dev python3-pip -y -f
sudo apt-get install git ffmpeg libxss1 xdg-utils -y -f
sudo apt-get install cmake -y -f
sudo apt install iverilog verilator ghdl -y -f
sudo apt install v4l2loopback-dkms -y -f
# sudo apt-get install kdenlive gimp obs-studio -y -f
# sudo apt-get install libreoffice -y -f
# sudo apt-get install atom -y -f
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

# 更新
sudo apt upgrade -y
flatpak update

# 安裝Kit
wget -O kite-installer https://linux.kite.com/dls/linux/current
bash kite-installer --download
bash kite-installer --install

# 安裝slang
git clone https://github.com/MikePopoloski/slang.git
cd slang
mkdir build && cd build
cmake -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/bin ..
make -j8
ctest
bin/unittests
sudo make install
cd ../../

# Python套件安裝
sudo python3 -m pip install -r requirements.txt --upgrade

# 安裝Dulwich
git clone https://github.com/dulwich/dulwich.git
cd dulwich/
sudo python3 setup.py --pure install
cd ..

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
apm install linter-gcc

# 終端機
apm install platformio-ide-terminal
