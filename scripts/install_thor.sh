#!/bin/sh
#Author: @kanr

### Install VeChain
echo "########################################################################"
echo "Downloading and installing VeChain Thor"
echo "########################################################################"
if [ ! -e "$GOPATH/src/github.com/vechain/thor" ]; then
  go get github.com/vechain/thor
  cd $GOPATH/src/github.com/vechain/thor
  echo "DEP ensuring ..."
  dep ensure
  make all --quiet
  echo | tree -L 4
  echo "Thor Installed"
  sleep 3s
else
  echo "Vechain Thor already installed"
fi
