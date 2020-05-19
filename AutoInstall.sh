# 系統更新與升級
apt-get update -y
apt-get install python3.6 python3.6-dev python3-pip -y
apt-get upgrade -y

# Python套件安裝
python3 -m pip install -r requirements.txt --upgrade

# Atom套件權限設定
chown -R $USER:$USER ~/.atom

# Python檢查套件
apm install linter
apm install linter-ui-default
apm install intentions
apm install linter-pylint
apm install linter-pycodestyle
apm install linter-pydocstyle
apm install linter-flake8

# Atom Python自動填寫
apm install Hydrogen
apm install kite
apm install autocomplete-python

# Atom繁體中文
apm install cht-menu

# Atom效能檢查
apm install busy-signal

# Atom Markdown
apm install pdf-view
apm install markdown-preview-enhanced
apm install markdown-table-editor
apm install insert-timestamp
apm install markdown-image-insertion
apm install markdown-image-assistant

