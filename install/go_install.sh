#! /bin/sh

echo "export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PATH=$(go env GOROOT)/bin:$(go env GOPATH)/bin:$PATH" >> ~/.zshrc

source ~/.zshrc

go install mvdan.cc/sh/v3/cmd/shfmt@latest
