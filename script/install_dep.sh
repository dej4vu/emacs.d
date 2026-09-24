#!/bin/sh

if ! command -v go >/dev/null 2>&1; then
  echo "Error: 'go' binary not found in PATH. Install Go first: https://go.dev/dl/"
  exit 1
fi

tmp=$(mktemp -d)
dst="${1:-$HOME/bin}"

#go env setup
export GOPATH=$tmp
export GOPROXY=https://goproxy.cn,https://goproxy.io,direct
export GO111MODULE=on
echo "GOPATH: $GOPATH"
deps="github.com/josharian/impl@latest \
	github.com/fatih/gomodifytags@latest\
	honnef.co/go/tools/cmd/staticcheck@latest\
	golang.org/x/tools/gopls@latest\
	github.com/go-delve/delve/cmd/dlv@latest\
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
