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
PROMPT='%F{blue}${USER}@${HOST} %F{yellow}%~
%F{cyan}|><>%F{white}'

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
