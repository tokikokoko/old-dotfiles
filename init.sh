#! /bin/bash

mkdir -p ~/Workspace/go

# goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
## rbenv-build
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

## opam
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)

# nodebrew
curl -L git.io/nodebrew | perl - setup
