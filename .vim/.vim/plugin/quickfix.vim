nnoremap <leader>q :call <SID>QuickfixToggle()<cr>

let s:quickfix_status = 0

function! s:QuickfixToggle()
   if s:quickfix_status ==# 0
      let s:winnr_number = winnr()
      copen
      let s:quickfix_status = 1
   else
      silent cclose
      echo s:winnr_number
      execute s:winnr_number . "wincmd w"
      let s:quickfix_status = 0
   endif
endfunction
