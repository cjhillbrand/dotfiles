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

    use({ 'catppuccin/nvim', as = 'catppuccin' })
    vim.cmd('colorscheme catppuccin-mocha')

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

    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    use({
        'williamboman/mason.nvim',
        requires = 'mason-org/mason-registry'
    })

    use('williamboman/mason-lspconfig.nvim')
    use('williamboman/mason-nvim-dap.nvim')

    -- LSP Support
    use('neovim/nvim-lspconfig')
    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('L3MON4D3/LuaSnip')

    use('mfussenegger/nvim-jdtls')
    use({
        'rcarriga/nvim-dap-ui',
        requires = {
            'nvim-neotest/nvim-nio',
            'mfussenegger/nvim-dap'
        }
    })
    use('aznhe21/actions-preview.nvim')

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
