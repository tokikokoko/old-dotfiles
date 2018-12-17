# ############
# fish config
# ############

if status --is-login

    # 環境変数読み込み
    source $HOME/.config/fish/env.fish

    # function & alias読み込み
    source $HOME/.config/fish/user_functions.fish
    source $HOME/.config/fish/aliases.fish


    # 環境依存設定読み込み
    if test -f $HOME/local.fish
        source $HOME/local.fish	
    end

    # fisherman
    if not test -f $HOME/.config/fish/functions/fisher.fish
        echo "==> Fisherman not found.  Installing."
        curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
        fisher
    end

    # NixOS
    fenv . $HOME/.nix-profile/etc/profile.d/nix.sh
end
