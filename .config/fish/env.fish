# PATH
set -x PATH /usr/local/bin $PATH

# ARCH
# SSH
set -x SSH_AUTH_SOCK 0 

# general
set DOT $HOME/dotfiles
set FISH_PATH (which fish)
set -x TERM rxvt-unicode-256color
set -x EDITOR nvim

# fcitx
set -x GTK_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"

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

# ruby
if test -d $HOME/.gem/ruby/2.5.0/bin
    set -x PATH $HOME/.gem/ruby/2.5.0/bin $PATH
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

# Qt
set -x QT_HOMEBREW true

# Kubectl
set -x KUBECONFIG_DEFAULT $HOME/.kube/config 
set -x KUBECONFIG $HOME/.kube/config 
set -x AWS_PROFILE beluga3
