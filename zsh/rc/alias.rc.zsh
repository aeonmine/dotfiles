# ls
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ll="ls -alG"
    zle -N expand-to-home-or-insert
    bindkey "@"  expand-to-home-or-insert
    ;;
linux*)
    alias ll="ls -al"
    ;;
esac

# process
# alias j="jobs -l"
alias 'ps?'='pgrep -l -f'
alias pk='pkill -f'

# du/df
alias duh="du -h ./ --max-depth=1"

# su
alias su="su -l"

# vim
#alias v='vim'
#alias 'src'='exec zsh'
#alias -g V="| vim -"
#alias -g EV="| xargs --verbose sh -c 'vim \"\$@\" < /dev/tty'"

# colorized cat
alias ccat='pygmentize -O style=vim -f console256 -g'

# less
alias less='less -r'

# git
alias gs='git status -s -b'
alias gst='git status -s -b'
alias gst="git log --date=short --max-count=1 --pretty=format:'%Cgreen%h %cd %Cblue%cn%x09%Creset%s' | tail -1 && echo '' && git status -s -b"

alias ev='vim ~/dotfiles/vim/rc/*.rc.vim'
alias asia='cd ~/Documents/git/asia-server'
alias second='cd ~/Documents/git/second'
alias gas='cd ~/Documents/git/google-spreadsheet-merge'
alias rose='cd ~/Documents/git/rose-server'
alias micro='cd ~/Documents/git/micro-svc-demo-game'

#alias vim='nvim'
#alias vi='nvim'

alias phpunit='./vendor/bin/phpunit'
