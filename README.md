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
- [linter-mypy](https://atom.io/packages/linter-mypy)
- [linter-pycodestyle](https://atom.io/packages/linter-pycodestyle)
- [linter-pylama](https://atom.io/packages/linter-pylama)
- [linter-pylint](https://atom.io/packages/linter-pylint)
- [linter-ui-default](https://atom.io/packages/linter-ui-default)

## Other
### Markdown
- [pdf-view](https://atom.io/packages/pdf-view)
- [markdown-toc](https://atom.io/packages/markdown-toc)
- [markdown-preview-enhanced](https://atom.io/packages/markdown-preview-enhanced)
- [markdown-table-editor](https://atom.io/packages/markdown-table-editor)
- [insert-timestamp](https://atom.io/packages/insert-timestamp):
- [markdown-image-insert](https://atom.io/packages/markdown-image-insert)
- [markdown-image-insertion](https://atom.io/packages/markdown-image-insertion)
- [Markdown-pdf](https://atom.io/packages/markdown-pdf):讓Mark-down可以輸出為pdf藉此輸出。

### Python
- [Hydrogen](https://atom.io/packages/Hydrogen):使用此可以在編輯Python時像Jupyter一樣編輯後馬上可以看到程式執行結果，此套件不需要相依[atom-ide-ui](https://atom.io/packages/atom-ide-ui)與[linter](https://atom.io/packages/linter)。
- [kite](https://atom.io/packages/kite)
- [autocomplete-python](https://atom.io/packages/autocomplete-python):Python變數、函式、模組、套件、除錯、自動輸入，使用Jedi與Kite技術作為支援，也是Kite官網在Atom上所指定與承認的套件，因此套件不需要相依[atom-ide-ui](https://atom.io/packages/atom-ide-ui)與[linter](https://atom.io/packages/linter)。

- [busy-signal](https://atom.io/packages/busy-signal):顯示其他套件是否執行忙碌。
<br>![](https://i.github-camo.com/8047fa31b60040277ec30c2757e44bfdab973d52/68747470733a2f2f636c6f75642e67697468756275736572636f6e74656e742e636f6d2f6173736574732f343237383131332f32323836353533362f30613132333037342d663138382d313165362d386336652d3338353734613666653134632e676966)
- [cht-menu](https://atom.io/packages/cht-menu):讓Atom顯示繁體中文介面。
- [intentions](https://atom.io/packages/intentions):將色碼顏色顯示在色碼下方。

- [teletype](https://atom.io/packages/teletype):允許開發人員與團隊成員共享他們的工作區，並同時協作代碼。
<br>
![](https://i.github-camo.com/adc3202a16c58d99323771f9bea103467fcafb22/68747470733a2f2f757365722d696d616765732e67697468756275736572636f6e74656e742e636f6d2f323938382f33323735333136372d64373831626166302d633839392d313165372d386236342d3638336162383464336138632e676966)
