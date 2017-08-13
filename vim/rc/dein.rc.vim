if has('nvim')
  let s:path = expand('~/.cache/nvim/dein')
else
  let s:path = expand('~/.cache/vim/dein')
endif

let s:dein_dir = s:path
                 \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if !dein#load_state(s:path)
  finish
endif

call dein#begin(s:path, expand('<sfile>'))

call dein#load_toml('~/dotfiles/vim/rc/dein.toml', {'lazy': 0})
call dein#load_toml('~/dotfiles/vim/rc/deinlazy.toml', {'lazy' : 1})

if has('nvim')
  call dein#load_toml('~/dotfiles/vim/rc/deineo.toml', {})
endif

if dein#tap('deoplete.nvim') && has('nvim')
  call dein#disable('neocomplete.vim')
"  call dein#disable('neocomplcache.vim')
endif

call dein#end()
call dein#save_state()

if dein#check_install()
  " Installation check.
  call dein#install()
endif
