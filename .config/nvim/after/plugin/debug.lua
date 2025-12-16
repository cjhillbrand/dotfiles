local dap, dapui = require("dap"), require("dapui")

require('dapui').setup()

dap.listeners.before.attach.dapui_config = function()
      dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>dt', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.api.nvim_set_hl(0, 'DapBreakpointColor', { fg = '#FF0000', bg = 'none' })
vim.fn.sign_define("DapBreakpoint", { text = "󰨰", texthl = "DapBreakpointColor", linehl = "", numhl= "" })
