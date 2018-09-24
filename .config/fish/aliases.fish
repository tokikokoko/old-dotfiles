# cd
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# vim
alias vim='nvim'

# exa
for p in $PATH
    if test -x $p/exa
        function ls -d "[alias]ls"
            exa $argv
        end
        break
    end
end

# git
function gi -d "[alias]git"
    git $argv
end
function gic -d "[alias]git"
    git checkout $argv
end
function gib -d "[alias]git"
    git branch $argv
end
function giw -d "[alias]git"
    git worktree $argv
end
function gif -d "[alias]git"
    git fetch --prune $argv
end
function gim -d "[alias]git"
    git merge $argv
    ctags -R
end
function gifm -d "[alias]git"
    git fetch --prune
    git merge $argv
    ctags -R
end

# emacs
function ec -d "[alias]emacs"
    emacsclient -nw
end
function eg -d "[alias]emacs"
    emacsclient -c -a emacs
end

# docker
function dk -d "[alias]docker"
    docker $argv
end
function dkc -d "[alias]docker"
    docker-compose $argv
end
