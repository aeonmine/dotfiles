" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'
nnoremap <expr> gr ':Rgrep<CR>'
