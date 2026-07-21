vim.opt.termguicolors = true

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.showcmd = true

vim.opt.wrap = false

vim.opt.incsearch = true

-- vim.keymap.set('i', 'jk', '<C-\\><C-n>', { desc = "Exit insert mode" })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- buffers
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":BufDel<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<BS>", ":b#<CR>", { desc = "Jump to last buffer" })

-- tabs
vim.keymap.set("n", "ta", vim.cmd.tabnew, { desc = "Add tab" })
vim.keymap.set("n", "tr", ":Tabby rename_tab ", { desc = "Rename tab" })
vim.keymap.set("n", "tn", "gt", { desc = "Next tab" })
vim.keymap.set("n", "tp", "gT", { desc = "Previous tab" })

-- persistence
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Load session for current directory" })
vim.keymap.set("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select session to load" })
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Load last session" })
vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Turn off persistence" })

vim.cmd.colorscheme("catppuccin")

-- autosave
vim.api.nvim_create_autocmd(
  { "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
  { desc = "autosave", pattern = "*", command = "silent! update" }
)
