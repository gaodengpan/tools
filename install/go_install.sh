#! /bin/zsh

echo "
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PATH=$(go env GOROOT)/bin:$(go env GOPATH)/bin:$PATH" >> ~/.zshrc

source ~/.zshrc
