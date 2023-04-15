#! /bin/bash

curl -O https://go.dev/dl/go1.20.3.linux-amd64.tar.gz

tar xzf go1.20.3.linux-amd64.tar.gz

mv go /usr/local/ && rm go1.20.3.linux-amd64.tar.gz

echo 'export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> ~/.bashrc
