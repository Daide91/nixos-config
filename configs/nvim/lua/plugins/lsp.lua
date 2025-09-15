return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      handlers = {
        ["hls"] = function()
          require("lspconfig").hls.setup()
        end
      }
    },
    ft = { "lua", "javascript", "typescript", "python", "go", "haskell", "php", "vue"},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    keys = {
      {"<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Lsp goto definition"},
      {"<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Lsp goto implementation"},
      {"<leader>gr", "<cmd>lua vim.lsp.buf.refenerces()<cr>", desc = "Lsp goto references"},
    }
}
