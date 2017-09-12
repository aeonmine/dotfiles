let g:quickrun_config = {}
let g:quickrun_config._ = {
  \ 'runner' : 'vimproc',
  \ "runner/vimproc/updatetime" : 60,
  \ 'outputter/buffer/split' : ':botright 8sp',
  \ 'outputter/buffer/close_on_empty' : 1
  \}

let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': "rspec",
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': "bundle exec %c %o %s ",
  \ 'outputter/buffer/filetype': 'rspec-result',
  \ 'filetype': 'rspec-result'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': "rspec",
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': '%c %o %s',
  \ 'outputter/buffer/filetype': 'rspec-result',
  \ 'filetype': 'rspec-result'
  \}
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ?  quickrun#sweep_sessions() : "\<C-c>"

autocmd BufReadPost *_spec.rb call RSpecQuickrun()

augroup QuickRunPHPUnit
  autocmd!
augroup END
autocmd QuickRunPHPUnit BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit

let g:quickrun_config['php.phpunit'] = {
 \ 'outputter/buffer/split': 'vertical 35',
 \ 'command': 'phpunit',
 \ 'cmdopt': '',
 \ 'exec': '%c %o %s'
 \}

""""""""""""""""""""""""""""""""""""
" phpunit の color 設定
""""""""""""""""""""""""""""""""""""
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'quickrun'
endif

"大文字と小文字を区別する
syntax case match

"正規表現で一致
syntax match phpUnitOk /OK.*/
syntax match phpUnitFailures /FAILURES.*/

"group-nameをハイライトの指定と関連付け
highlight phpUnitOk term=reverse ctermbg=2 guibg=DarkGreen
highlight phpUnitFailures term=reverse ctermbg=4 guibg=DarkRed

"unlet b:current_syntax
let b:current_syntax = 'quickrun'

if main_syntax == 'quickrun'
  unlet main_syntax
endif
