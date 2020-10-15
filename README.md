開發環境建構
===
用於統一且紀錄開發環境的儲存庫，會講解開發時開注意什麼，以及將過去所有相關套件與工具，主要介紹Atom的Python、Markdown的工具，同時儲存庫有自動化安裝與佈署的腳本，其中Linux是介紹最為方便、完整與詳細，Windows反而沒有這麼詳細，其他的程式語言所使用的軟體與套件則有機會使用在放上去。

# 目錄
<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [目錄](#目錄)
- [Atom Packages](#atom-packages)
	- [Code Debugger and Tool](#code-debugger-and-tool)
		- [Atom IDE UI](#atom-ide-ui)
			- [Python](#python)
	- [linter](#linter)
	- [Other](#other)
		- [Markdown](#markdown)
		- [Python](#python)

<!-- /TOC -->

# Atom Packages
[Atom相關套件統整網站](https://atomlinter.github.io/)

## Code Debugger and Tool
- [atom-ide-ui](https://atom.io/packages/atom-ide-ui):IDE界面整合器，讓不同的套件可以在這上面使用，由Facebook與GitHub合作開發，FB已經將儲存庫設定為封存，已經沒有在繼續往前開發與更新。
- [linter](https://atom.io/packages/linter):一個IDE界面整合器，目前還有在更新，建議使用這個套件。

### Atom IDE UI
以下套件為相依此套件的軟體，必須安裝[atom-ide-ui](https://atom.io/packages/atom-ide-ui)才能使用。

#### Python
- [atom-ide-debugger-python](https://atom.io/packages/atom-ide-debugger-python):Python的除錯套件。
- [ide-python](https://atom.io/packages/ide-python):提供Python原始碼編輯，有以下功能:
  - [Jedi](https://github.com/davidhalter/jedi)用於完成、定義、懸停、引用、簽名幫助和符號。
  - [Rope](https://github.com/python-rope/rope)完成和重命名。
  - [Pyflakes](https://github.com/PyCQA/pyflakes)用於檢測各種錯誤。
  - [McCabe](https://github.com/PyCQA/mccabe)為復雜性檢查做好準備。
  - [pycodestyle](https://github.com/PyCQA/pycodestyle)用於原始碼風格檢查。
  - [Pylint](https://www.pylint.org/):用於檢測各種錯誤。
  - [pydocstyle](https://github.com/PyCQA/pydocstyle)用於文件風格檢查的。
  - [autopep8](https://github.com/hhatto/autopep8)用於原始碼格式化(優先於YAPF)。
  - [YAPF](https://github.com/google/yapf)用於原始碼格式化。

## linter
- [linter-flake8](https://atom.io/packages/linter-flake8)
- [linter-js-yaml](https://atom.io/packages/linter-js-yaml)
- [linter-mypy](https://atom.io/packages/linter-mypy):相依linter，使用Mypy的靜態檢查，還不清楚一些問題檢查結果。
- [linter-pycodestyle](https://atom.io/packages/linter-pycodestyle)
- [linter-pylama](https://atom.io/packages/linter-pylama)
- [linter-pylint](https://atom.io/packages/linter-pylint)
- [linter-ui-default](https://atom.io/packages/linter-ui-default)

## Other
### PLC
[language-structured-text](https://atom.io/packages/language-structured-text):PLC程式語法套件。  

### Gettext
[language-text](https://atom.io/packages/language-text):  
[language-structured-text](https://atom.io/packages/language-structured-text):  
[language-as-structured-text](https://atom.io/packages/language-as-structured-text):  

### Markdown
- [pdf-view](https://atom.io/packages/pdf-view):檢視PDF檔案的套件，基本上不用設定即可使用。
- [markdown-toc](https://atom.io/packages/markdown-toc):製作目錄的工具，當建立成功後在存檔時會自動更新，但目前有一些Buy存在，當編輯的頁面關起或換到其他Markdown文件時，新增目錄的動作會在就頁面使用，會被鎖定在以更換的頁面中持續新增，必須重新開啟才可解決。
- [markdown-preview-enhanced](https://atom.io/packages/markdown-preview-enhanced):功能最強大的markdown套件，包括跟蹤滾動頁面、內建PDF轉換程式、照片貼上、照片上傳處理等，為內建套件`markdown-preview`的更強大套件，預設上會將內建的停用，並且刪除雙空白`  `換行，頁面以高亮風格為預設，不過可以自行設定使用Atom的Dock風格。還內建`markdown-toc`的功能並且錯誤問題較少。
- [markdown-table-editor](https://atom.io/packages/markdown-table-editor):製作表格工具，快速有效率。
- [insert-timestamp](https://atom.io/packages/insert-timestamp):時間戳製作功能，寫部落格式很棒的工具。
- [markdown-image-insert](https://atom.io/packages/markdown-image-insert):大陸人製作，雖然不會與照片衝突，但有一些小問題。
- [markdown-image-insertion](https://atom.io/packages/markdown-image-insertion):不提供快捷鍵，使用`Ctrl + Shift + P`來呼叫此功能出來，基本上不會與其他快捷鍵衝突。
- [markdown-pdf](https://atom.io/packages/markdown-pdf):讓Mark-down可以輸出為pdf藉此輸出，但輸出後不會將照片嵌入，不是很好用。
- [markdown-image-assistant](https://atom.io/packages/markdown-image-assistant):一個很好用的照片貼上套件，可以將照片拖曳到指定的欄位，使用`Ctrl + Shift + V`的快捷鍵，不影響原始的複製貼上快捷鍵。

### Python
- [Hydrogen](https://atom.io/packages/Hydrogen):使用此可以在編輯Python時像Jupyter一樣編輯後馬上可以看到程式執行結果，此套件不需要相依[atom-ide-ui](https://atom.io/packages/atom-ide-ui)與[linter](https://atom.io/packages/linter)。
- [kite](https://atom.io/packages/kite):
- [autocomplete-python](https://atom.io/packages/autocomplete-python):Python變數、函式、模組、套件、除錯、自動輸入，使用Jedi與Kite技術作為支援，也是Kite官網在Atom上所指定與承認的套件，因此套件不需要相依[atom-ide-ui](https://atom.io/packages/atom-ide-ui)與[linter](https://atom.io/packages/linter)。
- [python-linters](https://atom.io/packages/python-linters):Python的自動化檢查程式，可以取代[linter](https://atom.io/packages/linter)一系列套件，相當不錯，但不可與其他linter其他檢查套件共存使用，會出現錯誤訊息，相依[linter](https://atom.io/packages/linter)。
- [busy-signal](https://atom.io/packages/busy-signal):顯示其他套件是否執行忙碌。

<br>![](https://i.github-camo.com/8047fa31b60040277ec30c2757e44bfdab973d52/68747470733a2f2f636c6f75642e67697468756275736572636f6e74656e742e636f6d2f6173736574732f343237383131332f32323836353533362f30613132333037342d663138382d313165362d386336652d3338353734613666653134632e676966)

- [cht-menu](https://atom.io/packages/cht-menu):讓Atom顯示繁體中文介面。
- [intentions](https://atom.io/packages/intentions):將色碼顏色顯示在色碼下方。

- [teletype](https://atom.io/packages/teletype):允許開發人員與團隊成員共享他們的工作區，並同時協作代碼。

# Verilog
- [linter-veriloghdl](https://atom.io/packages/linter-veriloghdl)
- [verilog-tools](https://atom.io/packages/verilog-tools)
