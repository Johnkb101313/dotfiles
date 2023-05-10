require('nvim-treesitter.configs').setup({
   ensure_installed = { "javascript", "lua", "c", "html", "css" },
   auto_install = true,

   highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
   }
})
