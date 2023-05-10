let g:astro_typescript = 'enable'

augroup FileType_astro
   autocmd!
   autocmd BufNewFile *.astro :execute "normal! i---\<esc>o---"
augroup END
