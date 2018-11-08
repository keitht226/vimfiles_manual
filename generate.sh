#!/bin/bash

cp -rf ~/.vim vim
cp ~/.vimrc vimrc
find vim/ -type d -name ".git" | xargs -d '\n' rm -rf
