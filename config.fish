#set -gx GCLOUD_SDK_PATH "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"

#set -gx GOPATH "$HOME/go"
#set -gx PATH $GOPATH/bin $PATH $GCLOUD_SDK_PATH/bin

set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

alias vim=nvim
alias vi=nvim
alias vault=/usr/local/bin/vault
alias ayanami='cd ~/Documents/git/ayanami-server'

function fish_user_key_bindings
    bind \cr peco_select_history
end
