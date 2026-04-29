vim.opt.termguicolors = true

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true

-- vim.keymap.set('i', 'jk', '<C-\\><C-n>', { desc = "Exit insert mode" })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- buffers
vim.keymap.set('n', '<leader>bn', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', vim.cmd.bprevious, { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', ':BufDel<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<BS>', ':b#<CR>', { desc = 'Jump to last buffer' })

-- tabs
vim.keymap.set('n', 'ta', vim.cmd.tabnew, { desc = 'Add tab' })
vim.keymap.set('n', 'tr', ':Tabby rename_tab ', { desc = 'Rename tab' })
vim.keymap.set('n', 'tn', 'gt', { desc = 'Next tab' })
vim.keymap.set('n', 'tp', 'gT', { desc = 'Previous tab' })

-- substitute
vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })

vim.cmd.colorscheme "catppuccin"

-- autosave
vim.api.nvim_create_autocmd(
  { "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
  { desc = "autosave", pattern = "*", command = "silent! update" }
)
