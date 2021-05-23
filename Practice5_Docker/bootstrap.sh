
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


## sudo docker exec containerName jupyter notebook list
## sudo docker exec webprueba ls /syncfolder

## docker run -d --name containerName -p 8800:8888 
## -v ~/localVolume:/containerVolume imageName