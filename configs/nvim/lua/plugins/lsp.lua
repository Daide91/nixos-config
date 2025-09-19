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
      {"<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Lsp Goto Definition"},
      {"<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Lsp Goto Implementation"},
      {"<leader>gr", "<cmd>lua vim.lsp.buf.refenerces()<cr>", desc = "Lsp Goto References"},
      {"<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Show Can Use Code Action"},
    }
}
