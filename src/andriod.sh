# Dart
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

# 給 Flutter 使用
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev -y -f

# 給 Dart 使用
sudo apt-get install dart -y -f

# 安裝 Flutter
sudo snap install flutter --classic

# 安裝 Android Studio
flatpak install flathub com.google.AndroidStudio --system -y

# 安裝 DevTools
flutter pub global activate devtools

# 設定相關環境
flutter config --android-studio-dir=/var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
flutter doctor --android-licenses

# flutter 確認開發環境
flutter doctor

# 安裝 Atom 套件
apm install dart atom-toolbar
