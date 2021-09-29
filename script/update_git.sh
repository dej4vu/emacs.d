#!/bin/sh
wget http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
sudo rpm -ivh wandisco-git-release-7-2.noarch.rpm
sudo yum update git
