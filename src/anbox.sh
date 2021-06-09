sudo modprobe ashmem_linux
sudo modprobe binder_linux
sudo ls -1 /dev/{ashmem,binder}
snap install --devmode --beta anbox

wget https://raw.githubusercontent.com/geeks-r-us/anbox-playstore-installer/master/install-playstore.sh

chmod +x install-playstore.sh

./install-playstore.sh
