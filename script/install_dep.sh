#!/bin/sh
mkdir tmp
export GOPATH=$(pwd)/tmp
export GOPROXY=https://goproxy.io
export GO111MODULE=on
for dep in "
	github.com/stamblerre/gocode
	github.com/josharian/impl
	golang.org/x/tools/cmd/godoc
	github.com/davidrjenni/reftools/cmd/fillstruct
	github.com/fatih/gomodifytags
	golang.org/x/tools/cmd/guru
	github.com/rogpeppe/godef
	golang.org/x/lint/golint
	golang.org/x/tools/cmd/gorename
	github.com/sqs/goreturns
	golang.org/x/tools/gopls@latest
"
do
	go get -v -u $dep
done
go clean -modcache
