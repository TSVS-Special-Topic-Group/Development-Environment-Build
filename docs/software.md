# 開發工具
作業系統，建議依照數字順序：

1. Linux
2. Mac
3. Windows

文字編輯器

- Atom
  - 支援：Linux、Windows、Mac

版本控制軟體

- 註冊
  - GitHub
  - GitLab
- 核心
  - Git
- 圖形界面
  - GitKarken
    - 支援：Linux、Windows、Mac
  - SmartGit
    - 支援：Linux、Windows、Mac
  - SourceTree
    - 支援：Linux、Windows、Mac
  - GitHub Desktop
    - 支援：Windows、Mac
  - TortoiseGit：Windows推薦使用這個，唯一支持開放原始碼免費軟體
    - 支援：Windows
- 學習
  - [30 天精通 Git 版本控管](https://github.com/doggy8088/Learn-Git-in-30-days)

程式語言：

- Python
  - 支援：Linux、Windows、Mac
  - Python Package:有[PyPi](https://pypi.org/)套件管理工具，我們所有使用的套件可以[看這](/requirements.txt)，可以使用`pip install -r requirements.txt --upgrade`安裝，部份套件在Windows對於C/C++/C#等環境要求相當嚴苛
    - [twine](https://twine.readthedocs.io/)：推送到[PyPi](https://pypi.org/)的工具
    - [setuptools](https://setuptools.readthedocs.io/)：一個程式套件管理
  - Documentation
    - [sphinx-rtd-theme](https://sphinx-rtd-theme.readthedocs.io/)
    - [Sphinx](https://www.sphinx-doc.org)
  - 自動填寫：
    - [Jedi](https://github.com/davidhalter/jedi)：用於完成、定義、懸停、引用、簽名幫助和符號。
    - [Kite](https://www.kite.com/)：用於完成、定義、懸停、引用、簽名幫助和符號。
  - Auto Format Style
    - [YAPF](https://github.com/google/yapf)
    - [autopep8](https://github.com/hhatto/autopep8)
    - [Rope](https://github.com/python-rope/rope)：完成和重新命名。
  - Style
    - Flake8
    - [pydocstyle](https://github.com/PyCQA/pydocstyle/)：PEP 257
    - [pycodestyle](https://github.com/PyCQA/pycodestyle)：PEP 8
  - Static Code Analysis
    - [Pyflakes](https://github.com/PyCQA/pyflakes)
    - [Pylint](https://www.pylint.org/)
    - [MyPy](https://mypy.readthedocs.io)
  - Testing
    - [Pylama](https://pylama.readthedocs.io/)
    - [pytest](https://docs.pytest.org/)
    - [unittest](https://docs.python.org/zh-tw/3/library/unittest.html)：Python內建函式庫套件，建議使用Pytest
    - [McCabe](https://github.com/PyCQA/mccabe)：「循環複雜度」(Cyclomatic complexity)檢測。
    - [Radon](https://radon.readthedocs.io)
    - 「覆蓋率」(Coverage)
      - [Coverage.py](https://coverage.readthedocs.io/)
      - [pytest-cov](https://github.com/pytest-dev/pytest-cov)
      - [pytest-xdist](https://github.com/pytest-dev/pytest-xdist)
- C
  - 支援：Linux、Windows、Mac
  - 編譯器
    - [GCC, the GNU Compiler Collection](https://gcc.gnu.org/)
      - [Installing GCC: Binaries](https://gcc.gnu.org/install/binaries.html)
      - [TDM-GCC](https://jmeubank.github.io/tdm-gcc/)
      - [Cygwin](https://cygwin.com/)
      - [Mingw-w64](http://mingw-w64.org/doku.php)
    - [Clang](https://clang.llvm.org/)
  - Debugger
    - GDB
  - Style
    - [Indent](https://www.gnu.org/software/indent/)
    - [Artistic Style](http://astyle.sourceforge.net/)
    - [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html)
    - [Uncrustify](https://github.com/uncrustify/uncrustify)
  - Build Automation：提供C語言專案管理，範例 [Binary Search Tree in C.](https://github.com/cwchentw/bstree-c)
    - [Make](https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_makefiles.html)：Unix系統都有內建，Linux跟Mac相當方面與友善
    - [CMake](https://cmake.org/)
    - [Automake](https://www.gnu.org/software/automake/manual/html_node/Autotools-Introduction.html)
  - Static Code Analysis
    - [https://clang-analyzer.llvm.org/](https://clang-analyzer.llvm.org/)
    - [Splint](http://lclint.cs.virginia.edu/)：目前 Splint 已經停止維護，故不建議繼續使用。
    - [Infer](https://fbinfer.com/)：限 GNU/Linux, macOS
    - [Cppcheck](http://cppcheck.sourceforge.net/)
  - Memory Checking
    - [Valgrind](https://valgrind.org/)
  - Testing
    - [Check](https://libcheck.github.io/check/#)
    - [CUnit](http://cunit.sourceforge.net/)
  - Documentation
    - [Doxygen](https://www.doxygen.nl/index.html)
    - [Sphinx](https://www.sphinx-doc.org/en/master/)
- HDL：詳細請參考 [數位邏輯設計/1-開發環境建置](https://github.com/Multimedia-Processing/Digital-Logic-Design/blob/master/docs/1-%E9%96%8B%E7%99%BC%E7%92%B0%E5%A2%83%E5%BB%BA%E7%BD%AE.md)
  - Quartus II 64-bit 15.0 Web Edition
  - Quartus II 32-bit 13.1 Web Edition
  - Quartus II 64-bit Web Edition：使用最新版即可
  - Xilinx Vivado：使用最新版即可
  - Opne Source：
    - iverilog
    - verilator
    - ghdl
    - slang

學習資源：

- [OpenHome.cc](https://openhome.cc/)
- [kaiching.org](http://kaiching.org/)
- [開放原始碼技術文件網](https://opensourcedoc.com/)
- [鳥哥的Linux私房菜](https://linux.vbird.org/)
