####################
### zplug
####################

## zplug install command
# git clone https://github.com/zplug/zplug $ZPLUG_HOME
# init
ZPLUG_HOME=$HOME/.zplug
source ~/.zplug/init.zsh
# define plugins
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'chrissicool/zsh-256color'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'mollifier/cd-gitroot'

# load plugins
zplug load --verbose


####################
### ENV 
####################

# PATH
path=(/usr/local/bin(N-/) $path)
path=($HOME/.local/bin(N-/) $path)
path=(/home/linuxbrew/.linuxbrew/bin(N-/) $path)
path=($HOME/.yarn/bin(N-/) $path)
path=($HOME/.rbenv/bin(N-/) $path)
path=($HOME/.rbenv/shims(N-/) $path)
path=($HOME/.cargo/bin(N-/) $path)

## golang
export GOENV_ROOT="$HOME/.goenv"
path=($GOENV_ROOT/bin(N-/) $path)
path=($GOENV_ROOT/shims(N-/) $path)
export GOPATH=($HOME/Workspace/go)
path=($HOME/Workspace/go/bin(N-/) $path)
test -r $HOME/.goenv/libexec/../completions/goenv.zsh && source $HOME/.goenv/libexec/../completions/goenv.zsh > /dev/null 2> /dev/null || true
command goenv rehash 2>/dev/null
goenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(goenv "sh-$command" "$@")";;
  *)
    command goenv "$command" "$@";;
  esac
}

## node
if [ -f ./node_modules/.bin ]; then
	export PATH=./node_modules/.bin:$PATH
fi

## SSH
export SSH_AUTH_SOCK=0 

## LESS
export LESS='-g -i -M -R -S -W -z-4 -x4'

## DOTFILES
DOT=~/dotfiles

## TERM
TERM=xterm-256color

## shell history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

## kubectl
export KUBECONFIG_DEFAULT=$HOME/.kube/config 
export KUBECONFIG=$HOME/.kube/config 
export AWS_PROFILE=beluga3

## google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/keita/google-cloud-sdk/path.zsh.inc' ]; then
	. $HOME/google-cloud-sdk/path.zsh.inc
	. $HOME/google-cloud-sdk/completion.zsh.inc
fi
## Linux
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx

## Git Editor
export EDITOR=nvim

## prompt
setopt prompt_subst
PROMPT="%F{blue}${USER}@${HOST} %F{yellow}[%~] %(?.$fg[green].$fg[red])(%?)%F{$reset_color}
%F{cyan}> %F{white}"

## compinit
autoload -U compinit
compinit
zstyle ':completion:"default' menu select=2
# improve compinit view
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
# group compinit candidate
zstyle ':completion:*' group-name ''
# separate candidate
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

### alias ###
alias la='exa -a'
alias ll='exa -l'
alias lal='exa -al'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias diff='colordiff'

## vim
# vim path
alias vim='nvim'

## emacs
# emacs functions
# alias
alias em='emacsclient -nw'

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_LEGACY_KEYBINDINGS=1
export FZF_FIND_FILE_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--color=dark --ansi'

## keybind
bindkey -e

### functions ###
# emacs restart-server
function restart_server() {
    emacsclient -e '(kill-emacs)'
    emacs --daemon
}

# emacs kill_server
function kill_server() {
    emacsclient -e '(kill-emacs)'
}

# shell relogin
function relogin(){
    echo '---------------------------'
    echo '------- new session -------'
    echo '---------------------------'
    exec $SHELL -l
}

# test function
function testfunc(){
	echo "test"
	echo "test"
	return 125
}

# rbenv configuration
test -r $HOME/.rbenv && eval "$(rbenv init -)" > /dev/null 2> /dev/null || true
# opam configuration
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# nvm configuration
test -r /usr/share/nvm/init-nvm.sh && source /usr/share/nvm/init-nvm.sh > /dev/null 2> /dev/null || true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/keita/google-cloud-sdk/path.zsh.inc' ]; then . '/home/keita/google-cloud-sdk/path.zsh.inc'; fi


