return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Telescope find files" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Telescope live grep" }
    }
}
