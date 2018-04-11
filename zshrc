export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
## Backspace key
bindkey "^?" backward-delete-char
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
setopt transient_rprompt

stty stop undef
stty start undef

## Default shell configuration
# colors enables us to idenfity color by $fg[red].
autoload colors
colors

# zplug
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
 zplug "sorin-ionescu/prezto"
 # install後に実行
 # ln -s $HOME/.zplug/repos/sorin-ionescu/prezto $HOME/.zprezto
zplug load

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

## alias設定
[ -f ~/dotfiles/zsh/rc/alias.rc.zsh ] && source ~/dotfiles/zsh/rc/alias.rc.zsh

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

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd
# cd でTabを押すとdir list を表示
setopt auto_pushd
# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups
# コマンドのスペルチェックをする
setopt correct
# コマンドライン全てのスペルチェックをする
setopt correct_all
# 上書きリダイレクトの禁止
setopt no_clobber
# 補完候補リストを詰めて表示
setopt list_packed
# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types
# 補完候補が複数ある時に、一覧表示する
setopt auto_list
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# カッコの対応などを自動的に補完する
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
# シンボリックリンクは実体を追うようになる
#setopt chase_links
# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu
# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0
# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios
# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt noautoremoveslash
# beepを鳴らさないようにする
setopt nolistbeep
setopt extended_glob
bindkey -v
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# glob(*)によるインクリメンタルサーチ
if zle -la | grep -q '^history-incremental-pattern-search'; then
  bindkey '^r' history-incremental-pattern-search-backward
  bindkey '^s' history-incremental-pattern-search-forward
else
  bindkey '^r' history-incremental-search-backward
  bindkey '^s' history-incremental-search-forward
fi
## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 登録済コマンド行は古い方を削除
setopt hist_ignore_all_dups
# historyの共有
setopt share_history
# 余分な空白は詰める
setopt hist_reduce_blanks
# add history when command executed.
setopt inc_append_history
# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
# コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt path_dirs
# ctrl-w, ctrl-bキーで単語移動
bindkey "^W" forward-word
bindkey "^B" backward-word
# back-wordでの単語境界の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified
# URLをコピペしたときに自動でエスケープ
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
# 勝手にpushd
setopt autopushd
# エラーメッセージ本文出力に色付け
e_normal=`echo -e "¥033[0;30m"`
e_RED=`echo -e "¥033[1;31m"`
e_BLUE=`echo -e "¥033[1;36m"`
function make() {
    LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}
function cwaf() {
    LANG=C command ./waf "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot¥sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -u
## zsh editor
autoload zed
## Prediction configuration
autoload predict-on
bindkey -a 'q' push-line
setopt complete_aliases     # aliased ls needs if file/dir completions work
case "${OSTYPE}" in
# MacOSX
darwin*)
    export PATH=$PATH:/opt/local/bin:/opt/local/sbin/
    export PATH=$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/
    ;;
freebsd*)
    case ${UID} in
    0)
        updateports()
        {
            if [ -f /usr/ports/.portsnap.INDEX ]
            then
                portsnap fetch update
            else
                portsnap fetch extract update
            fi
            (cd /usr/ports/; make index)

            portversion -v -l \<
        }
        alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
        ;;
    esac
    ;;
esac
## terminal configuration
unset LSCOLORS
case "${TERM}" in
xterm)
    export TERM=xterm-color

    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character

    stty erase
    ;;

cons25)
    unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad

    export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30'
    zstyle ':completion:*' list-colors \
        'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;

kterm*|xterm*)
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad

    zstyle ':completion:*' list-colors \
        'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;

dumb)
    echo "Welcome Emacs Shell"
    ;;
esac

export EDITOR=nvim
export PATH=$PATH:$HOME/local/bin:/usr/local/git/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:/sbin:/usr/local/bin
export PATH="$HOME/pear/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man

expand-to-home-or-insert () {
        if [ "$LBUFFER" = "" -o "$LBUFFER[-1]" = " " ]; then
                LBUFFER+="~/"
        else
                zle self-insert
        fi
}

# zsh の exntended_glob と HEAD^^^ を共存させる。
# http://subtech.g.hatena.ne.jp/cho45/20080617/1213629154
typeset -A abbreviations
abbreviations=(
  "L"    "| $PAGER"
  "G"    "| grep"

  "HEAD^"     "HEAD\\^"
  "HEAD^^"    "HEAD\\^\\^"
  "HEAD^^^"   "HEAD\\^\\^\\^"
  "HEAD^^^^"  "HEAD\\^\\^\\^\\^\\^"
  "HEAD^^^^^" "HEAD\\^\\^\\^\\^\\^"
)

magic-abbrev-expand () {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9^]#}
  LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
}

magic-abbrev-expand-and-insert () {
  magic-abbrev-expand
  zle self-insert
}

magic-abbrev-expand-and-accept () {
  magic-abbrev-expand
  zle accept-line
}

no-magic-abbrev-expand () {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-insert
zle -N magic-abbrev-expand-and-accept
zle -N no-magic-abbrev-expand
bindkey "\r"  magic-abbrev-expand-and-accept # M-x RET はできなくなる
bindkey "^J"  accept-line # no magic
bindkey " "   magic-abbrev-expand-and-insert
bindkey "."   magic-abbrev-expand-and-insert
bindkey "^x " no-magic-abbrev-expand

# prompt設定
source ${HOME}/dotfiles/zsh/rc/custom.rc.zsh
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

