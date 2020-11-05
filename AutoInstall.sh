# 系統更新與升級
sudo apt-get update -y
sudo apt-get install python3 python3-dev python3-pip -y -f
sudo apt-get install git ffmpeg libxss1 xdg-utils -y -f
sudo apt install iverilog verilator cmake -y -f
sudo apt-get upgrade -y

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
python setup.py --pure install
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
apm install language-verilog language-vhdl lancelot-language-hdl
