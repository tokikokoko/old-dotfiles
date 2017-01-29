alias e='emacsclient -nw'
alias rm='rm -f'

set -x PATH $PATH

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
