### zplug ###
# init
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

### prompt ###
setopt prompt_subst
PROMPT="%F{blue}${USER}@${HOST} %F{yellow}%~
%F{cyan}|><-'> %F{white}"

### golang ###
path=(/usr/local/go/bin(N-/) $path)

### virtualenv ###
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs

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
alias ls='ls -G1'
alias la='ls -Gfa'
alias ll='ls -Gfl'
alias lal='ls -Gfal'
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
