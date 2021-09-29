#!/bin/sh
#mkdir tmp
#export GOPATH=$(pwd)/tmp
export GOPROXY=https://goproxy.cn,https://goproxy.io,direct
export GO111MODULE=on
#go clean -modcache
deps="github.com/stamblerre/gocode@latest \
	github.com/josharian/impl@latest \
	golang.org/x/tools/cmd/godoc@latest\
	github.com/davidrjenni/reftools/cmd/fillstruct@latest\
	github.com/fatih/gomodifytags@latest\
	golang.org/x/tools/cmd/guru@latest\
	github.com/rogpeppe/godef@latest\
	golang.org/x/lint/golint@latest\
	golang.org/x/tools/cmd/gorename@latest\
	github.com/sqs/goreturns@latest\
	golang.org/x/tools/gopls@latest\
"
for dep in $deps
do
	echo "installing $dep"
	go install -v  $dep
done
