"""Upgrade Gitlab."""

from bs4 import BeautifulSoup
from os import system
from time import sleep
import requests


# 將此頁面的HTML GET下來
r = requests.get("", headers={
        "cookie": "",
        "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36"
    }
)

soup = BeautifulSoup(r.text, "html.parser")  # 將網頁資料以 html.parser
