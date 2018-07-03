
#!/bin/bash
#apt-get update && apt-get install git -y

GO_VERSION=${GO_VERSION:-1.10}
GO_URL="https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz"
DIRECTORY="/home/vagrant/go"

if [ ! -e "$DIRECTORY" ]; then
 mkdir /home/vagrant/go\
  /home/vagrant/go/src\
  /home/vagrant/go/bin\
  /home/vagrant/go/pkg\
  /home/vagrant/go/log
 # This is a more consistant way of installing go rather than using apt-get.
 ### Install Go
 echo "########################"
 echo "Downloading Go"
 echo "########################"
 wget -q "$GO_URL" 
 sudo tar -C /usr/local -xzf /home/vagrant/go$GO_VERSION.*.tar.gz

 else
 echo "Go Already installed"
fi 

#Set Go Environment Variable
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/vagrant/go
export PATH=$PATH:$GOPATH/bin
echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bash_profile
echo "export GOPATH=/home/vagrant/go" >> /home/vagrant/.bash_profile
echo "export PATH=$PATH:$GOPATH/bin" >> /home/vagrant/.bash_profile

#Install Go Dep
echo "Installing DEP"
#go get github.com/golang/dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh