return{
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
      }
    }
  },
  config = function ()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

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

    vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Run / Continue" } )
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Setp over" })
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Setp input" })
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Step out" })
    vim.keymap.set('n', '<Leader>dt', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" } )
    vim.keymap.set({'n', 'v'}, '<Leader>de', function() require('dap.ui.widgets').hover() end, { desc = "Evaluate" })
  end,
}
