#!/bin/sh
tmp=$(mktemp -d)
dst="${1:-$HOME/bin}"

#go env setup
export GOPATH=$tmp
export GOPROXY=https://goproxy.cn,https://goproxy.io,direct
export GO111MODULE=on
echo "GOPATH: $GOPATH"
deps="github.com/josharian/impl@latest \
	github.com/davidrjenni/reftools/cmd/fillstruct@latest\
	github.com/fatih/gomodifytags@latest\
	golang.org/x/lint/golint@latest\
	golang.org/x/tools/gopls@latest\
"
for dep in $deps
do
	echo "installing $dep"
	go install -v  $dep
done

echo "moving binary files to $dst"
mv $tmp/bin/* $dst

#cleanup tmp files
echo "clean up tmp files"
go clean -cache -modcache
rm -rf $tmp
