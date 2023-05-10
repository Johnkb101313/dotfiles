vim.g.lf_netrw = 1

require('lf').setup({
    default_cmd = 'lf',
    default_action = 'edit',

    winblend = 20, -- psuedotransparency level
    dir = "", -- directory where `lf` starts ('gwd' is git-working-directory, "" is CWD)
    direction = "float", -- window type: float horizontal vertical
    border = "curved", -- border kind: single double shadow curved
    height = 0.80, -- height of the *floating* window
    width = 0.85, -- width of the *floating* window
    escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
    focus_on_open = false, -- focus the current file when opening Lf (experimental)
    mappings = true, -- whether terminal buffer mapping is enabled
    tmux = false, -- tmux statusline can be disabled on opening of Lf
    -- highlights = { -- highlights passed to toggleterm
    --   Normal = { guibg = <VALUE> },
    --   NormalFloat = { link = 'Normal' },
    --   FloatBorder = {
    --     guifg = <VALUE>,
    --     guibg = <VALUE>
    --   }
    -- },

    -- Layout configurations
    layout_mapping = "<A-u>" -- resize window with this key
})

vim.keymap.set('n', "<leader>n", ":lua require('lf').start()<cr>")
