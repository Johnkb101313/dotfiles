inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Enable Preview Window
" allow modifying the completeopt variable, or it will be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview
