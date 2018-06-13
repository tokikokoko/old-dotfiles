# # prompt
# function fish_prompt
# 	test $SSH_TTY
#     and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
#     test $USER = 'root'
#     and echo (set_color red)"#"
# 
#     # Main
#     echo -n (set_color cyan)(prompt_pwd) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
# end

# emacs-daemon
function restart_server -d "Restart emacsclient"
    emacsclient -e '(kill-emacs)'
    emacs --daemon
end

function kill_server -d "Stop emacsclient"
    emacsclient -e '(kill-emacs)'
end

# shell
function relogin -d "Re-login current shell"
    exec /usr/local/bin/fish -l
end

# auto execute ctags
# Example
# -> AutoCtags 300 "--exclude="*.js" --exclude=".git*" --exclude="*.ts" --extra=+f"
# Result
# -> execute ctags every 300sec
function AutoCtagsP
    set rem (math '$argv[1] % 10')
    set div (math '$argv[1] / 10')
    while true
	set count 1
	set flag false
	ctags -R . $argv[2]
	while true
	    if math '$count > $div'
		break
	    end
	    sleep 10
	    echo (math '$count * 10')
	    set count (math '$count + 1')
	end
	sleep $rem
    end
end

function AutoCtags
    while true
	ctags -R . $argv[2]
	sleep $argv[1]
    end
end

# git get branches
function get_git_branches
    git branch --list --all | awk '{print substr($0, 3, length($0))}'
end

# git checkout
function gc
    git checkout (get_git_branches | fzf)
end
