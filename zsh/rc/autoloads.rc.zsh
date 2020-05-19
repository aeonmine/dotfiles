# colors enables us to idenfity color by $fg[red].
autoload colors && colors
# カーソル位置を行末にする
autoload history-search-end
# URLをペーストした時に自動でエスケープ
autoload -Uz url-quote-magic
## zsh editor
autoload zed
## Prediction configuration
# autoload predict-on
# 補完の有効化
autoload -U compinit && compinit -u
# back-wordでの単語境界の設定
autoload -Uz select-word-style && select-word-style default
