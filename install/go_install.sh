#! /bin/zsh

apt-get install -y golang

echo "export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PATH=$(go env GOROOT)/bin:$(go env GOPATH)/bin:$PATH" >> ~/.zshrc

source ~/.zshrc
