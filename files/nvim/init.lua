-- 设置 leader 键为空格
vim.g.mapleader = " "

-- relate editor key
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- bind normal shortcut
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', { noremap = true, silent = true, desc = 'Reload config' })
