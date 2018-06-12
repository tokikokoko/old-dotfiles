# PATH
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x PATH /usr/local/bin $PATH

# general
set DOT $HOME/dotfiles
set -x TERM xterm-256color
set -x EDITOR nvim

# fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 1
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_DEFAULT_OPTS '--color=light'
# node
if test -d ./node_modules/.bin
    set -x PATH ./node_modules/.bin $PATH
end

# yarn
if test -d $HOME/.yarn
    set -x PATH $HOME/.yarn/bin $PATH
end

# go-lang
if test -d $HOME/.go
    set -x GOPATH $HOME/.go
    set -x PATH $HOME/.go/bin $PATH
end

# rust-lang
if test -d $HOME/.cargo
    set -x PATH $HOME/.cargo/bin $PATH
end
