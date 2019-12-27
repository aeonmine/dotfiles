let NERDTreeShowHidden=1

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" vimでdirectoryを開いた時にNERDTreeを開く
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" ctrl-n でtoggle
map <C-n> :NERDTreeToggle<CR>

" ファイルの方をアクティブにする
call NERDTreeHighlightFile('jade'   , 'green'   , 'none' , 'green'   , '#151515')
call NERDTreeHighlightFile('ini'    , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('md'     , 'blue'    , 'none' , '#3366FF' , '#151515')
call NERDTreeHighlightFile('yml'    , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('config' , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('conf'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('json'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('html'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('styl'   , 'cyan'    , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('css'    , 'cyan'    , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('coffee' , 'Red'     , 'none' , 'red'     , '#151515')
call NERDTreeHighlightFile('js'     , 'Red'     , 'none' , '#ffa500' , '#151515')
call NERDTreeHighlightFile('php'    , 'Magenta' , 'none' , '#ff00ff' , '#151515')


" NERDTreeとtaglistしか残らない場合は一緒に閉じる
function! NoExcitingBuffersLeft()
  if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  if winnr("$") == 2
    let w1 = bufname(winbufnr(1))
    let w2 = bufname(winbufnr(2))
    if ( exists(":NERDTree") && (w1 == "__Tag_List__" || w2 == "__Tag_List__") )
      if tabpagenr("$") == 1
        exec 'qa'
      else
        exec 'tabclose'
      endif
    endif
  endif
endfunction
autocmd bufenter * call NoExcitingBuffersLeft()
augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end
