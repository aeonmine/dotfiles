# PATHの設定
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:~/bin:$PATH
export PATH=$PATH:/opt/local/bin:/opt/local/sbin/
export PATH=$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/

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

# ssh
export SSHDIR="$HOME/.ssh"

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
# export GOPATH="$HOME/go"
export GOPATH="$HOME/go/1.14.2"
export PATH="$PATH:$GOPATH/bin"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="github.com/10antz-inc"
# export GOFLAGS=-mod=vendor
export EDITOR=/usr/local/bin/nvim

# gcloud
export PATH="$PATH:/usr/local/lib/google-cloud-sdk/bin"

# pip pacakge bin
# export PATH="$PATH:/Users/koichiro.haga/.local/bin"

# ncurses
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"
export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"
