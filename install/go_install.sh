#! /bin/bash

apt-get install -y golang

echo "
export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
" >> ~/.bashrc

source ~/.bashrc
