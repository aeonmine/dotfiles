## completion設定
[ -f ${HOME}/dotfiles/zsh/rc/styles/completion.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/styles/completion.rc.zsh
## zle設定
[ -f ${HOME}/dotfiles/zsh/rc/styles/zle.rc.zsh ] && source ${HOME}/dotfiles/zsh/rc/styles/zle.rc.zsh

## pure
zstyle :prompt:pure:path color cyan
zstyle :prompt:pure:prompt:success color yellow
zstyle :prompt:pure:prompt:error color red
