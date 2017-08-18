# ############
# fish config
# ############
# alias & function 読み込み
. $HOME/.config/fish/aliases.fish

# 環境変数読み込み
if status --is-login
	. $HOME/.config/fish/env.fish
end

# 環境依存設定読み込み
if test -f $HOME/local.fish
	. $HOME/local.fish	
end

# Ensure fisherman and plugins are installed
if not test -f $HOME/.config/fish/functions/fisher.fish
	echo "==> Fisherman not found.  Installing."
	curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
	fisher
end
