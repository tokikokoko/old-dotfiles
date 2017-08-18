alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# prompt
function fish_prompt
	test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test $USER = 'root'
    and echo (set_color red)"#"

    # Main
    echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

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
