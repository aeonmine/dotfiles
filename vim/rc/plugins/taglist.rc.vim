"------------------------------------
" taglist.Vim
"------------------------------------
" 関数一覧
set tags=tags
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' " ctagsのパス
let Tlist_Show_One_File = 1                  " 現在編集中のソースのタグしか表示しない
"let Tlist_Exit_OnlyWindow = 1
" let Tlist_Use_Right_Window = 1               " 右側でtaglistのウィンドーを表示
let Tlist_Enable_Fold_Column = 1             " 折りたたみ
"let Tlist_Auto_Open = 1                      " 自動表示
let Tlist_Auto_Update = 1
let Tlist_WinWidth = 30
let Tlist_Exit_OnlyWindow = 1
map <silent> <leader>tl :Tlist<CR>
