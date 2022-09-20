"""Auto Install python package."""
from os import system
import sys

system("echo > auto_install_python_pack.log")
PACKAGE = "pip"

with open('requirements.txt', 'r', encoding='utf8') as file:
    print(sys.version)
    for line in file.readlines():
        if line != "\n" and line[:1] != "#":
            if sys.version[:3] == "3.8" and line[-13:-1] == " # python3.8":
                PACKAGE = line[:-13]
            elif line[-13:-4] != " # python":
                PACKAGE = line[:-1]
            else:
                PACKAGE = "pip"

            print(PACKAGE)
            system(
                "python3 -m pip install " +
                PACKAGE + " --upgrade --no-warn-script-location" +
                " >> auto_install_python_pack.log")
