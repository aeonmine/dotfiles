" エラー行をsignで表示する
let g:syntastic_enable_signs = 1
" 可能ならhighligt表示する
let g:syntastic_enable_highlighting = 1
" 自動的に開いたり閉じたりする
let g:syntastic_auto_loc_list=1
" rubocop
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']


