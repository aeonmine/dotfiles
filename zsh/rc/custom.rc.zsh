case ${UID} in
0)
    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    #
    # Color
    #
    DEFAULT=$'%{\e[1;0m%}'
    RESET="%{${reset_color}%}"
    GREEN="%{${fg[green]}%}"
    BLUE="%{${fg[blue]}%}"
    MAGENTA="%{${fg[magenta]}%}"
    RED="%{${fg[red]}%}"
    CYAN="%{${fg[cyan]}%}"
    WHITE="%{${fg[white]}%}"
    POH="haga.zsh $"

    #
    # Prompt
    #
    PROMPT='%{$fg_bold[blue]%}${USER}@%m ${RESET}${WHITE}${POH} ${RESET}'
    RPROMPT='${RESET}${WHITE}[${BLUE}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${RESET}'

    #
    # Vi入力モードでPROMPTの色を変える
    # http://memo.officebrook.net/20090226.html
    function zle-line-init zle-keymap-select {
      case $KEYMAP in
        vicmd)
        PROMPT="%{$fg_bold[cyan]%}${USER}@%m ${RESET}${WHITE}${POH} ${RESET}"
        ;;
        main|viins)
        PROMPT="%{$fg_bold[blue]%}${USER}@%m ${RESET}${WHITE}${POH} ${RESET}"
        ;;
      esac
      zle reset-prompt
    }
    zle -N zle-line-init
    zle -N zle-keymap-select

    # Show git branch when you are in git repository
    # http://d.hatena.ne.jp/mollifier/20100906/p1

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git svn hg bzr
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
    zstyle ':vcs_info:bzr:*' use-simple true

    autoload -Uz is-at-least
    if is-at-least 4.3.10; then
      # この check-for-changes が今回の設定するところ
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
      zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
      zstyle ':vcs_info:git:*' formats '(%s)-[%c%u%b]'
      zstyle ':vcs_info:git:*' actionformats '(%s)-[%c%u%b|%a]'
    fi

    function _update_vcs_info_msg() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        psvar[2]=$(_git_not_pushed)
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd _update_vcs_info_msg

    # show status of git pushed to HEAD in prompt
    function _git_not_pushed()
    {
      if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
        head="$(git rev-parse HEAD)"
        for x in $(git rev-parse --remotes)
        do
          if [ "$head" = "$x" ]; then
            return 0
          fi
        done
        echo "|?"
      fi
      return 0
    }

    # git のブランチ名 *と作業状態* を zsh の右プロンプトに表示＋ status に応じて色もつけてみた - Yarukidenized:ヤルキデナイズド :
    # http://d.hatena.ne.jp/uasi/20091025/1256458798
   autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

    function rprompt-git-current-branch {
      local name st color gitdir action
      if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
        return
      fi
      name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
      if [[ -z $name ]]; then
        return
      fi

      gitdir=`git rev-parse --git-dir 2> /dev/null`
      action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
      pushed="`_git_not_pushed`"
      #pushed="|?"

      st=`git status 2> /dev/null`
      if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=%F{green}
      elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=%F{yellow}
      elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=%B%F{red}
      else
         color=%F{red}
      fi
      echo "[$color$name$action$pushed%f%b]"
    }

    # PCRE 互換の正規表現を使う
    #setopt re_match_pcre

   RPROMPT='`rprompt-git-current-branch`${RESET}${WHITE}[${MAGENTA}%(5~,%-2~/.../%2~,%~)${WHITE}]${RESET}'

    ;;
esac
