"""Upgrade Gitlab."""

from os import system
from time import sleep

from bs4 import BeautifulSoup
import requests


system("sudo docker stop gitlab")
system("sudo docker rm gitlab")

for i in range(3):
    print(i)
    system(
        "docker run -d" +
        " --publish 443:443 --publish 80:80 --publish 23:22" +
        " --name gitlab --restart always" +
        " --volume /var/lib/gitlab/config/:/etc/gitlab" +
        " --volume /var/lib/gitlab/logs/:/var/log/gitlab" +
        " --volume /var/lib/gitlab/data/:/var/opt/gitlab" +
        " gitlab/gitlab-ce:15." + str(i) + ".0-ce.0")

    HAVE_DEVOPS = True
    while HAVE_DEVOPS:
        try:
            # 將此頁面的HTML GET下來
            r = requests.get("https://127.0.0.1", verify=False, timeout=60)

            # print(r.text)  # 印出HTML

            soup = BeautifulSoup(r.text, "html.parser")  # 將網頁資料以 html.parser

            # 取HTML標中的 <div class="title"></div> 中的<a>標籤存入sel
            sel = soup.select("h3")

            for s in sel:  # 印出網址跟標題
                print(s.text[1:-1])
                HAVE_DEVOPS = not (
                    "A complete DevOps platform" in s.text[1:-1])
        except requests.exceptions.SSLError:
            print("SSL Error")

        except requests.exceptions.ConnectionError:
            print("Connection Error")

        except TypeError:
            print('型別發生錯誤')

        except NameError:
            print('使用沒有被定義的對象')

        finally:
            sleep(1)

    system("sudo docker stop gitlab")
    system("sudo docker rm gitlab")
    system("docker rmi gitlab/gitlab-ce:15." + str(i) + ".0-ce.0")

system(
    "docker run -d" +
    " --publish 443:443 --publish 80:80 --publish 23:22" +
    " --name gitlab --restart always" +
    " --volume /var/lib/gitlab/config/:/etc/gitlab" +
    " --volume /var/lib/gitlab/logs/:/var/log/gitlab" +
    " --volume /var/lib/gitlab/data/:/var/opt/gitlab" +
    " gitlab/gitlab-ce:latest")
