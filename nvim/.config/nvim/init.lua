-- Plugin
require('plugins')

local set = vim.opt
local setlocal = vim.opt_local
local cmd = vim.cmd
local g = vim.g
local keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Number
set.number = true
set.relativenumber = true

-- Indent
set.expandtab = true
set.shiftwidth = 3
set.softtabstop = -1

-- Search
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true

-- Tab
set.showtabline = 2
set.splitbelow = true
set.splitright = true

-- Color
cmd.syntax('off')
set.background = 'dark'
set.termguicolors = true
cmd.colorscheme('kanagawa')
-- Terminal base 16 colors
vim.g.terminal_color_0 = '#1d1f21'
vim.g.terminal_color_1 = '#cc6666'
vim.g.terminal_color_2 = '#b5bd68'
vim.g.terminal_color_3 = '#f0c674'
vim.g.terminal_color_4 = '#81a2be'
vim.g.terminal_color_5 = '#b294bb'
vim.g.terminal_color_6 = '#8abeb7'
vim.g.terminal_color_7 = '#c5c8c6'
vim.g.terminal_color_8 = '#666666'
vim.g.terminal_color_9 = '#d54e53'
vim.g.terminal_color_10 = '#b9ca4a'
vim.g.terminal_color_11 = '#e7c547'
vim.g.terminal_color_12 = '#7aa6da'
vim.g.terminal_color_13 = '#c397d8'
vim.g.terminal_color_14 = '#70c0b1'
vim.g.terminal_color_15 = '#eaeaea'

-- Filetype
cmd.filetype('on')
cmd.filetype('indent on')
cmd.filetype('plugin on')

-- Cursor
set.cursorline = true

-- Line
set.wrap = true
set.linebreak = true

-- Status
set.showcmd = true
set.showmode = false
set.ruler = false

-- Scroll
set.scrolloff = 4

-- Signcolumn
set.signcolumn = 'yes'

-- Keymap
-- Leader Key
g.mapleader = ","
keymap({'n', 'i', 'v', 'o'}, "<up>", '')
keymap({'n', 'i', 'v', 'o'}, "<down>", '')
keymap({'n', 'i', 'v', 'o'}, "<left>", '')
keymap({'n', 'i', 'v', 'o'}, "<right>", '')
keymap('n', "<leader>d", ":set relativenumber!<cr>", {silent = true})

-- Register Z
keymap('n', 'yzc', ":let @z = ''<cr>:echom '@z clear!'<cr>")

-- init.lua
keymap('n', "<leader>ev", ":vnew ~/.config/nvim/init.lua")
keymap('n', "<leader>sv", ":source ~/.config/nvim/init.lua")

-- Autocmd group
augroup('Appearance', {clear = true})
augroup('HandleWritePre', {clear = true})
augroup('FileType_c', {clear = true})

-- ** Autocmd **
-- Appearance group
autocmd({'WinEnter'},
        {group = 'Appearance', pattern = "*", command = "setlocal cursorline"})
autocmd({'WinLeave'}, {
    group = 'Appearance',
    pattern = "*",
    command = "setlocal nocursorline"
})
-- END
-- HandleWritePre group
autocmd({'BufWritePre'},
        {group = 'HandleWritePre', pattern = "*", command = "%s/\\s\\+$//e"})
-- END
-- FileType_c group
autocmd({'FileType'}, {
    group = 'FileType_c',
    pattern = 'c',
    command = "setlocal makeprg=gcc\\ %\\ -o\\ %<\\ -g"
})
autocmd({'FileType'}, {
    group = 'FileType_c',
    pattern = 'c',
    command = "nnoremap <buffer> <leader>c :make<cr>"
})
autocmd({'FileType'}, {
    group = 'FileType_c',
    pattern = 'c',
    command = "nnoremap <buffer> <leader>e :!%:p:h/%<<cr>"
})
-- END

-- Abbreviation
cmd('iabbrev ssig Johnkbeg')
cmd('iabbrev @@ Johnkb101313@gmail.com')
