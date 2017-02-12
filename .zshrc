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

### prompt ###
setopt prompt_subst
PROMPT="%F{blue}${USER}@${HOST} %F{yellow}%~
%F{cyan}|><-'> %F{white}"

### virtualenv ###
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
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
alias ls='ls -Gf'
alias la='ls -Gfa'
alias ll='ls -Gfl'
alias lal='ls -Gfal'

### vim ###
# vim path
alias vim='mvim'

### emacs ###
# emacs functions
# alias
alias em='emacsclient -nw'

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
