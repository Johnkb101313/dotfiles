require("formatter").setup({

    -- Log settings :
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,

    filetype = {
        lua = {require("formatter.filetypes.lua").luaformat},

        javascript = {require("formatter.filetypes.javascript").prettier},

        -- c = {require("formatter.filetypes.c").clangformat}
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {"--style=mozilla"},
                    stdin = true
                }
            end
        }
        -- I am already use my autocmd to do this
        -- ["*"] = {
        --    require("formatter.filetypes.any").remove_trailing_whitespace
        -- }
    }

})

-- Format after save
vim.api.nvim_create_augroup('Plugin_Formatter', {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
    group = 'Plugin_Formatter',
    command = "FormatWrite"
})
