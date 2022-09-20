"""Auto Install python package."""
from os import system


system("echo > auto_install_python_pack.log")

with open('requirements.txt', 'r', encoding='utf8') as file:
    for line in file.readlines():
        if line != "\n" and line[:2] != "# ":
            print(line[:-1])
            system(
                "python3 -m pip install " +
                line[:-1] + " --upgrade --no-warn-script-location" +
                " >> auto_install_python_pack.log")
