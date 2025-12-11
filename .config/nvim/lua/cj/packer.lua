-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Simple plugins can be specified as strings
    use 'rstacruz/vim-closer'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    require('rose-pine').setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = 'moon',
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = 'moon'
    })

    use({ 'rose-pine/neovim', as = 'rose-pine' })

    vim.cmd('colorscheme rose-pine')


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use("tpope/vim-fugitive")
    use("christoomey/vim-tmux-navigator",
        {
            cmd = {
                "TmuxNavigateLeft",
                "TmuxNavigateDown",
                "TmuxNavigateUp",
                "TmuxNavigateRight",
                "TmuxNavigatePrevious",
                "TmuxNavigatorProcessList",
            },
            keys = {
                { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
                { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
                { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
                { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
                { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
            }
        })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use('mfussenegger/nvim-jdtls')
    use('scalameta/nvim-metals')

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({
        "epwalsh/obsidian.nvim",
        tag = "*", -- recommended, use latest release instead of latest commit
        requires = {
            "nvim-lua/plenary.nvim",
            "telescope.nvim",
        },
        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "personal",
                        path = "$HOME/second-brain/second-brain/personal",
                    }
                },
                picker = {
                    name = "telescope.nvim"
                },

            })
        end,
    })
end)
