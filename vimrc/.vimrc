" Plugin
call plug#begin()

" Status Line
Plug 'vim-airline/vim-airline'

" Colorscheme
Plug 'morhetz/gruvbox'

" File manager
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" Surround
Plug 'Johnkb101313/eagle'

" VIM-TMUX-navigator
Plug 'christoomey/vim-tmux-navigator'

" Lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Emmet
Plug 'mattn/emmet-vim'

" Auto-complete
Plug 'prabirshrestha/asyncomplete.vim'
" Auto-complete Source
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Astro
Plug 'wuelnerdotexe/vim-astro'

call plug#end()

" Number
set number
set relativenumber

" Indent
set expandtab
set shiftwidth=3
set softtabstop=-1 "-1 == shiftwidth

" Search
set hlsearch
set ignorecase " ignore Upper case and Lower case
set smartcase " pay attention to Upper case
set incsearch
" You can use :nohlsearch to disable highlighting word what you are searched previous

" Tab
set showtabline=2
set splitbelow
set splitright

" Color
syntax on
set background=dark
set termguicolors
try
   colorscheme gruvbox
catch
   colorscheme default
endtry
" Base 16 colors (Same with alacritty default colors)
let g:terminal_ansi_colors=['#1d1f21','#cc6666','#b5bd68','#f0c674', '#81a2be','#b294bb','#8abeb7','#c5c8c6','#666666','#d54e53','#b9ca4a','#e7c547','#7aa6da','#c397d8','#70c0b1','#eaeaea']

" Filetype
filetype on
filetype indent on
filetype plugin on

" Key match time
" (troubleshoot for go back to normal mode from insert mode delay problem)
" If using tmux, plz add ```set -sg escape-time = 0``` into .tmux.conf
" That wait for tmux combo-key
set ttimeoutlen=0

" Map
" map command
" :help key-notation
" :map
" :unmap
" :nunmap
" :vunmap
" :mapclear
" :help <Nop>
" Leader key
let mapleader=","

" Disable arrow key
noremap <up> <nop>
inoremap <up> <nop>
noremap <down> <nop>
inoremap <down> <nop>
noremap <left> <nop>
inoremap <left> <nop>
noremap <right> <nop>
inoremap <right> <nop>

" Toggle of relativenumber
noremap <leader>d :<c-u>set relativenumber!<cr>

" Search the WORD under the cursor
" nnoremap <leader>g :silent execute "grep -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 13<cr>

" Quickfix Window operate
" cnext and cprevious
" nnoremap <leader>cn :cnext<cr>
" nnoremap <leader>cp :cprevious<cr>

" Vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" TODO
" Register Z for append new context to previously context
noremap yz "Zy
noremap yzp "Zp
nnoremap yzc :let @z = ""<cr>:echom "@z clear!"<cr>

" Time travel to Vi
" set compatible
" set nocompatible (default)

" List set:
" List custom set
" :set
" List all set on vim
" :set all

" Cursor
set cursorline

" Line
set wrap
set linebreak

" Status
set noshowmode
set showcmd
set noruler

" Scroll off
set scrolloff=4

" Show \n, etc...
" set list

" List all event
" :help autocmd-event

augroup Appearance
   autocmd!
   autocmd WinEnter * setlocal cursorline
   autocmd WinLeave * setlocal nocursorline
augroup END

" Delete all space from last of each line
augroup HandleWritePre
   autocmd!
   autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Abbreviation
iabbrev ssig Johnkbeg
iabbrev @@ Johnkb101313@gmail.com

augroup FileType_c
   autocmd!
   autocmd FileType c :iabbrev <buffer> maf int main(int argc,char *argv[])<cr>{<cr>return 0;<cr>}
   autocmd FileType c :setlocal makeprg=gcc\ %\ -o\ %<
augroup END

" ----------------------------------
" Display Information when vim start
" ----------------------------------

let s:echo_line = "--------"
let s:will_go_filename = expand("%:p")
let s:will_go_filename_strlen = strlen(s:will_go_filename)

if s:will_go_filename ==# ''
   echo "\nGOING_> [No filename]"
   echo "---------------------"
else
   while strlen(s:echo_line) !=# s:will_go_filename_strlen + 8
      let s:echo_line .= '-'
   endwhile
   echo "\nGOING_> " . s:will_go_filename
   echo s:echo_line
endif

echo "Hope you have a GOOD DAY 󱜙\n"
