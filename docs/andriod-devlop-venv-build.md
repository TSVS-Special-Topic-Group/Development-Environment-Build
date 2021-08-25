# Android 開發環境建置

# 目錄

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

- [Android 開發環境建置](#android-開發環境建置)
- [目錄](#目錄)
- [自行建置整合開發環境](#自行建置整合開發環境)
  - [Dart](#dart)
  - [Flutter](#flutter)
  - [DevTools](#devtools)
  - [Atom](#atom)
- [Android Studio](#android-studio)
- [問題](#問題)
- [參考資料](#參考資料)

<!-- /code_chunk_output -->

# 自行建置整合開發環境
最簡單執行環境。

## Dart
```
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt-get update
sudo apt-get install dart
```

## Flutter

```
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev
```

檢查環境

```
flutter doctor -v
```

會輸出以下內容：

```
[✓] Flutter (Channel stable, 2.2.2, on Linux, locale zh_TW.UTF-8)
    • Flutter version 2.2.2 at /home/timmy/snap/flutter/common/flutter
    • Framework revision d79295af24 (7 周前), 2021-06-11 08:56:01 -0700
    • Engine revision 91c9fc8fe0
    • Dart version 2.13.3

[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at /home/timmy/Android/Sdk/
    • Platform android-S, build-tools 30.0.3
    • Java binary at: /var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio/jre/bin/java
    • Java version OpenJDK Runtime Environment (build 11.0.8+0-b944-P17168821)
    • All Android licenses accepted.

[✓] Chrome - develop for the web
    • Chrome at google-chrome

[✓] Linux toolchain - develop for Linux desktop
    • clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
    • cmake version 3.10.2
    • ninja version 1.8.2
    • pkg-config version 0.29.1

[✓] Android Studio
    • Android Studio at /var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • android-studio-dir = /var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
    • Java version OpenJDK Runtime Environment (build 11.0.8+0-b944-P17168821)

[✓] Connected device (2 available)
    • Linux (desktop) • linux  • linux-x64      • Linux
    • Chrome (web)    • chrome • web-javascript • Google Chrome 91.0.4472.164

• No issues found!
```

代表整個環境都建置與準備好。

這個指令是同意Google針對Android的授權與條款，才可以進行整合開發。如果沒有透過`flutter doctor --android-licenses`指令的話，會出現下列問題：

```
[✓] Flutter (Channel unknown, 1.22.6, on Linux, locale zh_TW.UTF-8)
    • Flutter version 1.22.6 at /home/timmy/Git/flutter
    • Framework revision 9b2d32b605 (6 個月前), 2021-01-22 14:36:39 -0800
    • Engine revision 2f0af37152
    • Dart version 2.10.5

 
[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at /home/timmy/Android/Sdk
    • Platform android-S, build-tools 30.0.3
    • Java binary at: /usr/bin/java
    • Java version OpenJDK Runtime Environment (build 11.0.11+9-Ubuntu-0ubuntu2.20.04)
    • All Android licenses accepted.

[!] Android Studio (not installed)
    • Android Studio not found; download from https://developer.android.com/studio/index.html
      (or visit https://flutter.dev/docs/get-started/install/linux#android-setup for detailed instructions).

[✓] Connected device (1 available)
    • sdk gphone x86 64 arm64 (mobile) • emulator-5554 • android-x64 • Android 11 (API 30) (emulator)

! Doctor found issues in 1 category.
```

```
flutter doctor --android-licenses
```

```
sudo snap install flutter --classic
```

```
flutter config --enable-linux-desktop
```

這樣可以更新Flutter版本，通常Flutter內建最新的Dart，因此各位可以只安裝Flutter就可以使用Dart。

```
flutter upgrade
```

```
flutter run
```

執行結果：

```
Launching lib/main.dart on Chrome in debug mode...
Waiting for connection from debug service on Chrome...             51.6s
This app is linked to the debug service: ws://127.0.0.1:43173/HkPIAHf6hvI=/ws
Debug service listening on ws://127.0.0.1:43173/HkPIAHf6hvI=/ws

💪 Running with sound null safety 💪

🔥  To hot restart changes while running, press "r" or "R".
For a more detailed help message, press "h". To quit, press "q".
Loading app from service worker.

```

如果有修改程式碼，記得在comm按下`R`鍵讓它自動重新編譯與整理。

## DevTools
開發者工具
```
flutter pub global activate devtools
```

```
dart pub global activate devtools
```

```
dart pub global run devtools
```

```
cd path/to/flutter/app
flutter run
```

## Atom

# Android Studio

```
flatpak install flathub com.google.AndroidStudio --system -y
```

```
flatpak run com.google.AndroidStudio
```

```
flutter config --android-studio-dir=/var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
```

# 問題

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 2.2.1, on Linux, locale zh_TW.UTF-8)
[!] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK.
      Install Android Studio from: https://developer.android.com/studio/index.html
      On first launch it will assist you in installing the Android SDK components.
      (or visit https://flutter.dev/docs/get-started/install/linux#android-setup for detailed instructions).
      If the Android SDK has been installed to a custom location, please use
      `flutter config --android-sdk` to update to that location.

    ✗ No valid Android SDK platforms found in /usr/lib/android-sdk/platforms. Directory was empty.
[✓] Chrome - develop for the web
[!] Android Studio
    ✗ android-studio-dir = /var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/
    ✗ Unable to find bundled Java version.
[✓] Connected device (2 available)

! Doctor found issues in 2 categories.
```

```shell
flutter config --android-studio-dir=/var/lib/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio
```

```
Exception in thread "main" java.lang.NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema
	at com.android.repository.api.SchemaModule$SchemaModuleVersion.<init>(SchemaModule.java:156)
	at com.android.repository.api.SchemaModule.<init>(SchemaModule.java:75)
	at com.android.sdklib.repository.AndroidSdkHandler.<clinit>(AndroidSdkHandler.java:81)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:73)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:48)
Caused by: java.lang.ClassNotFoundException: javax.xml.bind.annotation.XmlSchema
	at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:581)
	at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:178)
	at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:522)
	... 5 more
```

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 2.2.1, on Linux, locale zh_TW.UTF-8)
[!] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK.
      Install Android Studio from: https://developer.android.com/studio/index.html
      On first launch it will assist you in installing the Android SDK components.
      (or visit https://flutter.dev/docs/get-started/install/linux#android-setup for detailed instructions).
      If the Android SDK has been installed to a custom location, please use
      `flutter config --android-sdk` to update to that location.

    ✗ No valid Android SDK platforms found in /usr/lib/android-sdk/platforms. Directory was empty.
[✓] Chrome - develop for the web
[✓] Android Studio
[✓] Connected device (2 available)
    ! Device emulator-5558 is offline.

! Doctor found issues in 1 category.
```

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 2.2.1, on Linux, locale zh_TW.UTF-8)
⣾[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
[✓] Chrome - develop for the web
[✓] Android Studio
[✓] Connected device (2 available)
    ! Device emulator-5558 is offline.

• No issues found!
```

```
5 of 6 SDK package licenses not accepted. 100% Computing updates...             
Review licenses that have not been accepted (y/N)? y

1/5: License android-googletv-license:
---------------------------------------
Terms and Conditions

This is the Google TV Add-on for the Android Software Development Kit License Agreement.

1. Introduction

...

14.7 This License Agreement, and your relationship with Google under this License Agreement, shall be governed by the laws of the State of California without regard to its conflict of laws provisions. You and Google agree to submit to the exclusive jurisdiction of the courts located within the county of Santa Clara, California to resolve any legal matter arising from this License Agreement. Notwithstanding this, you agree that Google shall still be allowed to apply for injunctive remedies (or an equivalent type of urgent legal relief) in any jurisdiction.


August 15, 2011
---------------------------------------
Accept? (y/N): y

2/5: License android-sdk-arm-dbt-license:
---------------------------------------
Terms and Conditions

This is the Android Software Development Kit License Agreement

1. Introduction

...

14.7 The License Agreement, and your relationship with Google under the License Agreement, shall be governed by the laws of the State of California without regard to its conflict of laws provisions. You and Google agree to submit to the exclusive jurisdiction of the courts located within the county of Santa Clara, California to resolve any legal matter arising from the License Agreement. Notwithstanding this, you agree that Google shall still be allowed to apply for injunctive remedies (or an equivalent type of urgent legal relief) in any jurisdiction.


January 16, 2019
---------------------------------------
Accept? (y/N): y

3/5: License android-sdk-preview-license:
---------------------------------------
To get started with the Android SDK Preview, you must agree to the following terms and conditions. As described below, please note that this is a preview version of the Android SDK, subject to change, that you use at your own risk. The Android SDK Preview is not a stable release, and may contain errors and defects that can result in serious damage to your computer systems, devices and data.

This is the Android SDK Preview License Agreement (the "License Agreement").

1. Introduction

...

14.7 The License Agreement, and your relationship with Google under the License Agreement, shall be governed by the laws of the State of California without regard to its conflict of laws provisions. You and Google agree to submit to the exclusive jurisdiction of the courts located within the county of Santa Clara, California to resolve any legal matter arising from the License Agreement. Notwithstanding this, you agree that Google shall still be allowed to apply for injunctive remedies (or an equivalent type of urgent legal relief) in any jurisdiction.

June 2014.
---------------------------------------
Accept? (y/N): y

4/5: License google-gdk-license:
---------------------------------------
This is a Developer Preview of the GDK that is subject to change.

Terms and Conditions

This is the Glass Development Kit License Agreement.

1. Introduction

...

14.7 This License Agreement, and your relationship with Google under this License Agreement, shall be governed by the laws of the State of California without regard to its conflict of laws provisions. You and Google agree to submit to the exclusive jurisdiction of the courts located within the county of Santa Clara, California to resolve any legal matter arising from this License Agreement. Notwithstanding this, you agree that Google shall still be allowed to apply for injunctive remedies (or an equivalent type of urgent legal relief) in any jurisdiction.

November 19, 2013
---------------------------------------
Accept? (y/N): y

5/5: License mips-android-sysimage-license:
---------------------------------------
MIPS Technologies, Inc. (“MIPS”) Internal Evaluation License Agreement for MIPS Android™ System Images for Android Software Development Kit (SDK): This Internal Evaluation License Agreement (this "Agreement") is entered into by and between MIPS and you (as an individual developer or a legal entity -- identified below as “Recipient”). MIPS shall make the Evaluation Software available to Recipient as described in accordance with the terms and conditions set forth below.

By clicking on the “Accept” button, downloading, installing, or otherwise using the Evaluation Materials (defined below), you agree to be bound by the terms of this Agreement effective as of the date you click “Accept” (the “Effective Date”), and if doing so on behalf of an entity, you represent that you are authorized to bind the entity to the terms and conditions of this Agreement. If you do not agree to be bound by the terms and conditions of this Agreement, do not download, install, or use the Evaluation Materials.

1. DEFINITIONS. These terms shall have the following meanings:

...

10.8 Open Source Software. In the event Open Source software is included with Evaluation Software, such Open Source software is licensed pursuant to the applicable Open Source software license agreement identified in the Open Source software comments in the applicable source code file(s) and/or file header as indicated in the Evaluation Software. Additional detail may be available (where applicable) in the accompanying on-line documentation. With respect to the Open Source software, nothing in this Agreement limits any rights under, or grants rights that supersede, the terms of any applicable Open Source software license agreement.
---------------------------------------
Accept? (y/N): y
All SDK package licenses accepted

```

![](assets/a736a69e.png)

# 參考資料
- Course
https://ithelp.ithome.com.tw/articles/10215158
- Issue
  - https://github.com/flutter/flutter/issues/18970
  - https://stackoverflow.com/questions/46402772/failed-to-install-android-sdk-java-lang-noclassdeffounderror-javax-xml-bind-a
- Flutter
  https://flutter.dev/docs/get-started/install
  https://flutter.dev/docs/get-started/install/linux
  https://flutter.dev/docs/get-started/install/linux#android-setup
- Android Studio
  - https://developer.android.com/studio
  - https://flathub.org/apps/details/com.google.AndroidStudio
- Dart
  - https://dart.dev/
  - https://dart.dev/get-dart#install-using-apt-get
  - https://dart.dev/tools/dart-devtools
  - https://dartpad.dev/
- DevTools
  - https://flutter.dev/docs/development/tools/devtools/overview
  - https://flutter.dev/docs/development/tools/devtools/cli
