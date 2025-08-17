vim.opt.termguicolors = true

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true

vim.keymap.set('i', 'jk', '<C-\\><C-n>', { desc = "Exit insert mode" })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

vim.keymap.set('n', '<C-s>', vim.cmd.w, { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save file (insert mode)' })

vim.keymap.set('n', '<leader>bn', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', vim.cmd.bnext, { desc = 'Previous buffer' })

vim.cmd.colorscheme "catppuccin"
