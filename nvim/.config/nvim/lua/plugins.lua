local packer = require('packer')

packer.startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'rebelot/kanagawa.nvim'
    use 'ellisonleao/gruvbox.nvim'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- External editor tool Manager & Lsp
    use {
        'williamboman/mason.nvim',
        -- Lsp
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        run = ':MasonUpdate' -- :MasonUpdate updates registry contents
    }

    -- Vim-Tmux-Navigator
    use 'christoomey/vim-tmux-navigator'

    -- Formatter
    use 'mhartington/formatter.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- CMP & source for CMP
    -- source for CMP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    -- CMP
    use 'hrsh7th/nvim-cmp'

    -- LF
    use 'lmburns/lf.nvim'
    -- ToggleTerm
    use {'akinsho/toggleterm.nvim', tag = '*'}
    -- Plenary
    use 'nvim-lua/plenary.nvim'

end)
