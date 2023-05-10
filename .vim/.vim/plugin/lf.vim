" disable lf.vim default key-bind <leader>f :Lf
let g:lf_map_keys = 0

" Opening lf instead of netrw (:edit ./dir)
let g:lf_replace_netrw = 1

" Map
nnoremap <leader>n :Lf<cr>
