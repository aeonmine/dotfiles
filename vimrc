"dein.vim
source ~/dotfiles/vim/rc/dein.rc.vim
"基本設定
source ~/dotfiles/vim/rc/basic.rc.vim
"StatusLine設定
source ~/dotfiles/vim/rc/statusline.rc.vim
"インデント設定
source ~/dotfiles/vim/rc/indent.rc.vim
"表示関連
source ~/dotfiles/vim/rc/apperance.rc.vim
"検索関連
source ~/dotfiles/vim/rc/search.rc.vim
"移動関連
source ~/dotfiles/vim/rc/moving.rc.vim
"Color関連
source ~/dotfiles/vim/rc/colors.rc.vim
"編集関連
source ~/dotfiles/vim/rc/editing.rc.vim
"エンコーディング関連
source ~/dotfiles/vim/rc/encoding.rc.vim
"プラグインに依存するアレ
source ~/dotfiles/vim/rc/plugins.rc.vim
if has('nvim')
  let g:python3_host_prog = expand('$HOME') . '/.anyenv/envs/pyenv/shims/python'
endif
