# cd
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
# vim
alias vim='nvim'
# emacs
alias e='emacsclient -nw'


# prompt
function fish_prompt
	test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test $USER = 'root'
    and echo (set_color red)"#"

    # Main
    echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

function restart_server -d "Restart emacsclient"
	emacsclient -e '(kill-emacs)'
	emacs --daemon
end

function kill_server -d "Stop emacsclient"
	emacsclient -e '(kill-emacs)'
end

function relogin -d "Re-login current shell"
	exec /usr/local/bin/fish -l
end
