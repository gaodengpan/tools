#! /bin/bash

wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz

tar xzf go1.20.3.linux-amd64.tar.gz

mv go /usr/local/

echo 'export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> ~/.bashrc

source ~/.bashrc
