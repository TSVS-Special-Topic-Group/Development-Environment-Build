docker pull python:latest
docker run -it -d --name docker-devlop-venv-build python:latest
git clone https://github.com/TSVS-Special-Topic-Group/Development-Environment-Build.git
apt-get update -yq
git clone https://github
apt-get upgrade -y
python -V  # Print out python version for debugging
pip install pip --upgrade
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt --upgrade
