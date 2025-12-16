-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}
    vim.keymap.set('n', 'K', function() vim.diagnostic.open_float() end, opts)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup()
require('mason-nvim-dap').setup({
    ensure_installed = { "java-debug-adapter", "java-test" }
})


local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

local preview = require('actions-preview')
vim.keymap.set('n', '>', function() preview.code_actions() end)
vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>cR', vim.lsp.buf.rename)

-- Some JDTLS key remaps
vim.keymap.set('n', '<leader>JT', "<Cmd> lua require('jdtls').test_class()<CR>", { desc = "[J]ava [T]est Class" })
vim.keymap.set('n', '<leader>Jt', "<Cmd> lua require('jdtls').test_nearest_method()<CR>", { desc = "[J]ava [T]est Class" })
vim.keymap.set('n', '<leader>JC', "<Cmd> lua require('jdtls').compile()<CR>", { desc = "[J]ava [T]est Class" })
