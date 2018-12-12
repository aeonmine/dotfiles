" エラー行をsignで表示する
let g:syntastic_enable_signs = 1
" 可能ならhighligt表示する
let g:syntastic_enable_highlighting = 1
" 自動的に開いたり閉じたりする
let g:syntastic_auto_loc_list=1
" rubocop
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['php', 'ruby', 'javascript', 'json'] }
let g:syntastic_ruby_checkers = ['rubocop']

" yarn global add eslint -- dev
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_php_checkers=['php']
let g:syntastic_quite_warnings=0

let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
hi SyntasticErrorSign ctermfg=160
hi SyntasticWarningSign ctermfg=220
