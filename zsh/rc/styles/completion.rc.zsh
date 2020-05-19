# 補完対象をハイライトする
zstyle ':completion:*:default' menu select=2
# cd a/b/c/h.ht[TAB]でも補完されるように
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# 色付きで補完する
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# 補完リストの冗長表示
#❯ kill [TAB]
#  406 ttys000    0:04.55 -zsh
#  407 ttys001    0:04.65 -zsh
zstyle ':completion:*' verbose yes
# 補完オプション
# _expand globや変数の展開を行う
# _complete 補完関数
# _match *などのglobによってコマンドを補完できる
# _prefix カーソルの位置で補完を行う
# _approximate スペルミスを訂正して補完する
# _history 履歴から補完する
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
# 補完対象外候補
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
