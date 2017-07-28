alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# vim
alias vim='nvim'

# emacs
alias e='emacsclient -nw'

function restart_server
	emacsclient -e '(kill-emacs)'
	emacs --daemon
end

function kill_server
	emacsclient -e '(kill-emacs)'
end

function relogin
	exec /usr/local/bin/fish -l
end
