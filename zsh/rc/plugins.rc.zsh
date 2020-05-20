# color
zinit load "chrissicool/zsh-256color"
zinit load "Tarrasch/zsh-colors"
zinit load "zsh-users/zsh-syntax-highlighting"
zinit load "ascii-soup/zsh-url-highlighter"

# tools
zinit load "zsh-users/zsh-completions"
zinit load "tarruda/zsh-fuzzy-match"

## コマンド候補を表示する
# zinit ice wait"!0" atload"_zsh_autosuggest_start"
# zinit load "zsh-users/zsh-autosuggestions"

zinit load "mafredri/zsh-async"
zinit load "sindresorhus/pure"

## これは便利
## xpanes -c "ping {}" 192.168.0.{1..9}
## 事前に brew install tmux-xpanes
zinit ice wait'!0'; zinit load "greymd/tmux-xpanes"

zinit ice wait"!0" atinit"zpcompinit; zpcdreplay"
zinit load "zsh-users/zsh-syntax-highlighting"

## エラーがでる。。わからない
# zinit ice atclone'./init.sh' nocompile'!' wait'!0'
# zinit ice wait'!0'; zinit load "b4b4r07/enhancd"

