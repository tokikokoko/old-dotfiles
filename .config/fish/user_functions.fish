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

function fish_greeting
    cowthink (fortune)
end

# emacs-daemon
function restart_server -d "Restart emacsclient"
    emacsclient -e '(kill-emacs)'
    emacs --daemon
end

function kill_server -d "Stop emacsclient"
    emacsclient -e '(kill-emacs)'
end

# shell
function re -d "Re-login current shell"
    exec fish --login
end

# tmux
function ta -d "Attach tmux session"
    tmux a -t $argv[1]
end

function tc -d "Create tmux session"
    tmux new -s $argv[1]
end

# kubernetes
function default_kube -d "Use default kubeconfig"
    set -x KUBECONFIG $KUBECONFIG_DEFAULT
end

# git get branches
function get_git_branches
    git branch -vv \
    | fzf --ansi \
    | awk '{print substr($0, 3, length($0))}' \
    | awk '{print $1}'
end

# git checkout
function gc
    git checkout (get_git_branches)
end

# git stage
function git_stage_list
    git status -s \
    | fzf --multi --ansi --tac \
    | awk '{if (NR==eof) printf "%s ", $2; else print $2}'
end

function gs
    git add (git_stage_list)
end

# Convert markdown to Github style html
function pandoc_convert_markdonw -d ""
    pandoc $argv[1] -s --self-contained -t html5 -c $HOME/.pandoc/github.css -o $argv[2]
end

# Kill process
function kill_ps
    ps | fzf | awk '{print $1}' | xargs kill
end

# Update ctags
function auto_ctags
    set c (pwd)
    fish -c "while sleep 300; ctags -R "$c"; end" &
end

# Docker container list
function dk_container_list
    docker container list \
    | fzf --multi \
    | awk '{print $1}'
end

function stop_container
    dk_container_list \
    | xargs docker container stop
end

# pbcopy
function pbcopy
    xclip -selection c
end
