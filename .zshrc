### zplug ###
# init zplug
source ~/.zplug/init.zsh
# plugins
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"
zplug "voronkovich/mysql.plugin.zsh"
zplug "marzocchi/zsh-notify"
zplug "sindresorhus/pretty-time-zsh"
# load plugins
zplug load --verbose

### PATH ###
export PATH="$PATH:/usr/local/bin:/usr/bin"

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
    exec $SHELL -l
}
