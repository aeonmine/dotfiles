"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
" ハイライト on
" syntax on

" colorscheme mrkn256
" colorscheme yuroyoro256
let g:onedark_color_overrides = {
\ "black": {"gui": "#000000", "cterm": "16", "cterm16": "0" },
\}
let g:onedark_termcolors = 256
colorscheme onedark
" colorscheme yuroyoro256
" autocmd BufRead * colorscheme onedark

autocmd FileType php :colorscheme yuroyoro256

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" 補完候補の色づけ for vim7
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" Highlight the 'error'
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" autocmd FileType javascript :highlight jsColonAtTail  cterm=underline ctermfg=lightblue guibg=darkgray
" autocmd FileType javascript :match jsColonAtTail /:$/
autocmd BufRead,BufNewFile *.es6 setfiletype javascript


" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
