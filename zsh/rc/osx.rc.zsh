export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:~/bin:$PATH

# osx alias
alias pbc='pbcopy'

# Terminal Colorの設定
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

##Java8
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
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
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# TERM
export TERM=xterm-256color

# gcp
export PATH=${0:A:h}/bin:$PATH

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - --no-rehash)"

# ssh
export SSHDIR="$HOME/.ssh"

function ssh_add_list(){
    if [ `ssh-add -l | grep "RSA" | wc -l` -eq 0 ]; then
        find ${SSHDIR} -name "github_rsa" | xargs ssh-add > /dev/null 2>&1
        find ${SSHDIR} -name "id_rsa_pz" | xargs ssh-add > /dev/null 2>&1
        echo "ssh-add を実行しました"
    fi
}
ssh_add_list

# adb
export PATH="/Applications/android_sdk/sdk/platform-tools:$PATH"

# production
export ENV=localhost

# neovim
export XDG_CONFIG_HOME=$HOME/.config

# nodebrew
# export PATH="$HOME/.nodebrew/current/bin:$PATH"
#

# libconv
export PATH="/usr/local/opt/libiconv/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libiconv/lib"
export CPPFLAGS="-I/usr/local/opt/libiconv/include"

# libiconv
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# bison
export PATH="/usr/local/opt/bison@2.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/bison@2.7/lib"

# go(global)
# プロジェクト毎の切り替えはdirenvで行う
export GOPATH="$HOME/Documents/go"
export PATH="$PATH:$GOPATH/bin"
export GOBIN="$GOPATH/bin"
# export GOFLAGS=-mod=vendor
export EDITOR=/usr/local/bin/nvim
eval "$(direnv hook zsh)"

# gcloud
export PATH="$PATH:/usr/local/lib/google-cloud-sdk/bin"
