# PATH
set -x PATH /usr/local/bin $PATH

# general
set DOT $HOME/dotfiles
set FISH_PATH (which fish)
set -x TERM screen-256color
set -x EDITOR nvim

# fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 1
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_DEFAULT_OPTS '--color=dark --ansi'

# node
if test -d ./node_modules/.bin
    set -x PATH ./node_modules/.bin $PATH
end

# yarn
if test -d $HOME/.yarn
    set -x PATH $HOME/.yarn/bin $PATH
end

# go-lang
if test -d $HOME/Workspace/go
    set -x GOPATH $HOME/Workspace/go
    set -x GOENV_ROOT $HOME/.goenv
    set -x PATH $GOENV_ROOT/bin $PATH
    if test -d $HOME/Workspace/go/bin
        set -x PATH $HOME/Workspace/go/bin $PATH
    end
    if test -d $HOME/.goenv/shims
        set -x PATH $GOENV_ROOT/shims $PATH
    end
end

# rust-lang
if test -d $HOME/.cargo
    set -x PATH $HOME/.cargo/bin $PATH
end
