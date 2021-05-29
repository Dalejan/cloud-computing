
echo "-- [Docker] Remove previous installations--"

sudo apt-get remove docker docker-engine docker.io containerd runc 
sudo apt-get update
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common -y

echo "-- [Docker] Add Docker GPG key--"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#sudo apt-key fingerprint 0EBFCD88

echo "-- [Docker] Add stable repo--"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "-- [Docker] Install the latest docker engine--"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y


echo "[DOCKER-COMPOSE] Install docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "[DOCKER] Remove use of sudo"

docker-compose -v
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo chmod 666 /var/run/docker.sock

echo "[CONF] Create and modify ~/.vimrc"
touch ~/.vimrc

echo -n '" Configuracion para trabajar con archivos yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab' > ~/.vimrc

# https://www.pluralsight.com/guides/using-react.js-with-docker

echo "[NODE] Install nodejs and npm"
sudo apt-get install nodejs -y
sudo apt-get install npm -y

