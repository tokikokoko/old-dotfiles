### zplug ###
## zplug install command
# git clone https://github.com/zplug/zplug $ZPLUG_HOME
# init
ZPLUG_HOME=$HOME/.zplug
source ~/.zplug/init.zsh
# define plugins
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'chrissicool/zsh-256color'
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# load plugins
zplug load --verbose

### DOTFILES ###
DOT=~/dotfiles

### TERM ###
TERM=xterm-256color

### shell history ###
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

### prompt ###
setopt prompt_subst
PROMPT="%F{blue}${USER}@${HOST} %F{yellow}%~
%F{cyan}|><-'> %F{white}"

### tmux ###
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi

### golang ###
path=(/usr/local/go/bin(N-/) $path)

### virtualenv ###
# 環境変数VIRTUALENVRAPPER_PYTHONに使用するPythonのパスを記述
# virtualenvwrapper.shのパスを調べ最後に実行する
# 以下設定例 
# VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
source $HOME/.virtualenvsetting

### compinit ###
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
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
#alias ls='ls -G1'
#alias la='ls -Gfa'
#alias ll='ls -Gfl'
#alias lal='ls -Gfal'
alias diff='colordiff'

### vim ###
# vim path
alias vim='nvim'

### emacs ###
# emacs functions
# alias
alias em='emacsclient -nw'

### fzf ###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
}
