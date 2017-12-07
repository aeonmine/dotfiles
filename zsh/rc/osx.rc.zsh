export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:~/bin:$PATH

# osx alias
alias pbc='pbcopy'

# Terminal Colorの設定
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

##Java7
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/Home
export PATH=$JAVA_HOME/bin:$PATH
# デフォルトエンコーディングSJISをUTF-8へ
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"

# man path
MANPATH=/usr/local/man:$MANPATH
export MANPATH
INFOPATH=/usr/local/info:$INFOPATH
export INFOPATH

# Mysql
export MYSQL_HOME=/usr/local
export PATH=$MYSQL_HOME/bin:$PATH

# TERM
export TERM=xterm-256color

# gcp
export PATH=${0:A:h}/bin:$PATH

source ~/dotfiles/zsh/rc/completion.zsh
