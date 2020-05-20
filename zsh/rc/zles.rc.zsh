# ls ^p|^n の時にカーソル位置を行末に持ってくる
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# URLをペーストした時にエスケープさせる
zle -N self-insert url-quote-magic
#
zle -N zle-line-init
zle -N zle-keymap-select
