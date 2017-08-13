"<Leader>b<Space>でBufferList
let dumbbuf_hotkey = '<Leader>b<Space>'
let dumbbuf_mappings = {
    \ 'n': {
        \'<Esc>': { 'opt': '<silent>', 'mapto': ':<C-u>close<CR>' }
    \}
\}
let dumbbuf_single_key  = 1
let dumbbuf_updatetime  = 1    " &updatetimeの最小値
let dumbbuf_wrap_cursor = 0
let dumbbuf_remove_marked_when_close = 1
