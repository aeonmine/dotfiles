export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export EDITOR=nvim
export PATH=$PATH:$HOME/local/bin:/usr/local/git/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:/sbin:/usr/local/bin
export PATH="$HOME/pear/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

## fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
export FZF_DEFAULT_OPTS='--preview "\
    if [[ -f {1} ]]; then \
        bat --color=always --style=header,grid --line-range :100 {1} \
    elif [[ -d {1} ]]; then \
        tree -C {1} | head -200 \
    else \
        echo {1} \
    fi
" --preview-window=right' #折り返し表示するなら :warp 追加
export FZF_ALT_C_OPTS='--preview "tree -C {1} | head -200"'
# ? で長いコマンドを全部表示
export FZF_CTRL_R_OPTS='--preview "echo {}" --preview-window down:3:hidden:wrap --bind "?:toggle-preview"'
# pure
export PURE_PROMPT_SYMBOL='❯ $'
export PURE_PROMPT_VICMD_SYMBOL='❮ $'

