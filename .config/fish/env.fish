# PATH

set -x PATH /usr/local/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH /usr/local/go/bin $PATH
set -x PATH $HOME/.go/bin $PATH

# general
set DOT $HOME/dotfiles
set -x TERM xterm-256color
set -x EDITOR emacs

# go-lang
set -x GOPATH $HOME/.go

# rust-lang
set -x PATH $HOME/.cargo/bin $PATH
