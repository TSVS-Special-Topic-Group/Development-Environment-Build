"""Auto Install python package."""
from os import system


with open('requirements.txt', 'r') as file:
    for line in file.readlines():
        if line != "\n":
            print(line[:-1])
            system(
                "python3 -m pip install " +
                line[:-1] + " --upgrade --no-warn-script-location")
