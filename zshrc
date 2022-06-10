stty stop undef
stty start undef

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

## export設定
[ -f ${HOME}/dotfiles/zsh/rc/exports.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/exports.rc.zsh
## plugin読み込み
[ -f ${HOME}/dotfiles/zsh/rc/plugins.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/plugins.rc.zsh
## function読み込み
[ -f ${HOME}/dotfiles/zsh/rc/functions.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/functions.rc.zsh
## setopt設定
[ -f ${HOME}/dotfiles/zsh/rc/options.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/options.rc.zsh
## alias設定
[ -f ${HOME}/dotfiles/zsh/rc/alias.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/alias.rc.zsh
## zstyle設定
[ -f ${HOME}/dotfiles/zsh/rc/styles.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/styles.rc.zsh
## bindkey設定
[ -f ${HOME}/dotfiles/zsh/rc/bindkeys.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/bindkeys.rc.zsh
## autoload設定
[ -f ${HOME}/dotfiles/zsh/rc/autoloads.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/autoloads.rc.zsh
## autoload設定
[ -f ${HOME}/dotfiles/zsh/rc/zles.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/zles.rc.zsh
## gcloud設定
[ -f ${HOME}/dotfiles/zsh/rc/gcloud/gcloud.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/gcloud/gcloud.rc.zsh
## fzf (brew install fzf && $(brew --prefix)/opt/fzf/install)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

case "${OSTYPE}" in
# MacOSX
darwin*)
    # ここに設定
    [ -f ~/dotfiles/zsh/rc/osx.rc.zsh ] && source ~/dotfiles/zsh/rc/osx.rc.zsh
    ;;
# Linux
linux*)
    # ここに設定
    [ -f ~/dotfiles/zsh/rc/linux.rc.zsh ] && source ~/dotfiles/zsh/rc/linux.rc.zsh
    ;;
esac

ZSH_HIGHLIGHT_STYLES[globbing]=fg=cyan
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=cyan

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/m-mine/MySpace/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/m-mine/MySpace/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/m-mine/MySpace/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/m-mine/MySpace/tools/google-cloud-sdk/completion.zsh.inc'; fi
