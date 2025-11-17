return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local util = require("lspconfig.util")

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" }, -- 不再写 volar
      handlers = {
        ["hls"] = function()
          vim.lsp.setup('hls')
        end,

        function(server_name)
          vim.lsp.setup(server_name)
        end,
      },
    })
  end,
  ft = { "lua", "javascript", "typescript", "python", "go", "haskell", "php", "vue" },
  keys = {
    { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>",     desc = "Lsp Goto Definition" },
    { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Lsp Goto Implementation" },
    { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>",     desc = "Lsp Goto References" },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>",    desc = "Show Can Use Code Action" },
  },
}
