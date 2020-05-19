# vi mode(viins)
bindkey -v
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
# bindkey "\\ep" history-beginning-search-backward-end
# bindkey "\\en" history-beginning-search-forward-end
# glob(*)によるインクリメンタルサーチ
# bindkey '^r' history-incremental-pattern-search-backward
# bindkey '^s' history-incremental-pattern-search-forward
# インクリメンタルサーチ
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
# ctrl-w, ctrl-bキーで単語移動
bindkey "^W" forward-word
bindkey "^B" backward-word

# vi mode(vicmd)
bindkey -a 'q' push-line
