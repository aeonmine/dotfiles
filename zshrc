if [ ! -e "${HOME}/.zplug/init.zsh" ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

source ~/.zplug/init.zsh

 zplug "wbinglee/zsh-wakatime"

# syntax
 zplug "chrissicool/zsh-256color"
 zplug "Tarrasch/zsh-colors"
 zplug "zsh-users/zsh-syntax-highlighting", defer:2
 zplug "ascii-soup/zsh-url-highlighter"

# tools
 zplug "zsh-users/zsh-completions"
 zplug "tarruda/zsh-fuzzy-match"

zplug load

source ${HOME}/dotfiles/zsh/rc/custom.rc.zsh
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

export PATH="$HOME/pear/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

alias server='cd ~/Documents/git/mirrors'
alias ayanami='cd ~/Documents/git/ayanami-server'
