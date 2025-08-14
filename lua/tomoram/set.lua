vim.opt.termguicolors = true

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = false

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.cmd.colorscheme "catppuccin"
