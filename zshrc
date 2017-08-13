if [ ! -e "${HOME}/.zplug/init.zsh" ]; then
    echo "nai"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

source ~/.zplug/init.zsh

zplug "wbinglee/zsh-wakatime"

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# program
zplug "voronkovich/mysql.plugin.zsh"

# tools
zplug "marzocchi/zsh-notify"
zplug "oknowton/zsh-dwim"

source ${HOME}/dotfiles/zsh/rc/custom.rc.zsh
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
