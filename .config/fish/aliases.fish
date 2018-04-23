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
	alias ls 'exa'
	break
    end
end

# emacs
alias ec='emacsclient -nw'
alias eg='emacsclient -c -a emacs'
