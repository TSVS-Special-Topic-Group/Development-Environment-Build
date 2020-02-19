sudo apt-get update -y
sudo apt-get install python3.6 python3.6-dev python3-pip -y
sudo apt-get upgrade -y
pip install -r requirements.txt --upgrade

apm install linter
apm install linter-pylint
apm install python-linters
apm install linter-pycodestyle
apm install linter-pydocstyle
apm install linter-flake8
apm install linter-pylama
apm install linter-mypy
apm install linter-vhdl
apm install linter-travis-lint
apm install linter-js-yaml
