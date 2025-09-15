return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {"<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "Nvim Tree Toggle"},
    {"<leader>fc", "<cmd>NvimTreeFindFile<cr>", desc = "Find Current File In Tree"}
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
