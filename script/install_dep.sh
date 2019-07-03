#!/bin/sh
mkdir tmp
export GOPATH=$(PWD)/tmp
for dep in "
	github.com/nsf/gocode
	github.com/josharian/impl
	golang.org/x/tools/cmd/godoc
	github.com/davidrjenni/reftools/cmd/fillstruct
	github.com/fatih/gomodifytags
	golang.org/x/tools/cmd/guru
	github.com/rogpeppe/godef
	golang.org/x/lint/golint
	golang.org/x/tools/cmd/gorename
	github.com/sqs/goreturns
"
do
	go get -v -u $dep
done
