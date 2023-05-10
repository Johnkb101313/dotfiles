require('lualine').setup({
    options = {
        theme = 'material',
        section_separators = {left = '', right = ''},
        components_separators = {left = '', right = ''}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    sections = {lualine_c = {'filename', lsp}}
})

-- #######################
-- #  Custom components  #
-- #######################

-- Lsp
local function lsp()
    local msg = 'No Active Lsp'
    local current_buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()

    if next(clients) == nil then return msg end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, current_buf_ft) ~= -1 then
            return client.name
        end
    end

    return msg
end
