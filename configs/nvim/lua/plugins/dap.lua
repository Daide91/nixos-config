return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",      -- 可视化 UI 面板
    "jay-babu/mason-nvim-dap.nvim",
    "williamboman/mason.nvim",   -- 自动安装 DAP 适配器
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    require("mason").setup()
    require("mason-nvim-dap").setup({
      ensure_installed = { "php" }, -- 自动安装 php-debug-adapter
      automatic_setup = true,
      handlers = {},
    })
    require("nvim-dap-virtual-text").setup()

    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()

    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
    vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, { desc = "Debug: See last session result." })
    vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    vim.keymap.set('n', '<F12>', function() dap.step_out() end)

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

		dap.configurations.php = {
			{
				name = "PHP: Listen for Xdebug",
				port = 9003,
				request = "launch",
				type = "php",
				breakpoints = {
					exception = {
						Notice = false,
						Warning = false,
						Error = false,
						Exception = false,
						["*"] = false,
					},
				},
			},
		}
  end
}

