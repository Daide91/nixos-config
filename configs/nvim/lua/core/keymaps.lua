vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', { noremap = true, silent = true, desc = 'Reload Config' })
-- move window
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Move To Left Window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Move To Down Window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Move To Up Window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Move To Right Window' })
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true, desc = 'Show Error Message In Float' })

-- buffer relate
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true, desc = 'Close Current Buffer'})
