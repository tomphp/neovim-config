print("Loading Idris2 ftplugin for buffer: " .. vim.api.nvim_get_current_buf())

local hover = require('idris2.hover')
local code_action = require('idris2.code_action')
local repl = require('idris2.repl')
local metavars = require('idris2.metavars')

local function save_and_run(fn)
  return function()
    vim.cmd('silent write')
    fn()
  end
end

vim.keymap.set('n', '<localleader>e', save_and_run(repl.evaluate), {
  buffer = true,
  desc = 'Evaluate'
})

vim.keymap.set('n', '<localleader>ion', save_and_run(hover.open_split), {
  buffer = true,
  desc = 'Info split mode'
})
vim.keymap.set('n', '<localleader>ioff', save_and_run(hover.close_split), {
  buffer = true,
  desc = 'Info default mode'
})
vim.keymap.set('n', '<localleader>t', save_and_run(hover.hover), {
  buffer = true,
  desc = 'Show type info'
})

vim.keymap.set('n', '<localleader>c', save_and_run(code_action.case_split), {
  buffer = true,
  desc = 'Case split'
})
vim.keymap.set('n', '<localleader>mc', save_and_run(code_action.make_case), {
  buffer = true,
  desc = 'Make case'
})
vim.keymap.set('n', '<localleader>w', save_and_run(code_action.make_with), {
  buffer = true,
  desc = 'Make with'
})
vim.keymap.set('n', '<localleader>l', save_and_run(code_action.make_lemma), {
  buffer = true,
  desc = 'Make lemma'
})
vim.keymap.set('n', '<localleader>a', save_and_run(code_action.add_clause), {
  buffer = true,
  desc = 'Add clause'
})
vim.keymap.set('n', '<localleader>s', save_and_run(code_action.expr_search), {
  buffer = true,
  desc = 'Expression search'
})
vim.keymap.set('n', '<localleader>d', save_and_run(code_action.generate_def), {
  buffer = true,
  desc = 'Generate definition'
})
vim.keymap.set('n', '<localleader>f', save_and_run(code_action.refine_hole), {
  buffer = true,
  desc = 'Refine hole'
})
vim.keymap.set('n', '<localleader>sh', save_and_run(code_action.expr_search_hints), {
  buffer = true,
  desc = 'Refine search with hints'
})
vim.keymap.set('n', '<localleader>o', save_and_run(code_action.intro), {
  buffer = true,
  desc = 'Fill metavar'
})

vim.keymap.set('n', ']h', save_and_run(metavars.goto_next), {
  buffer = true,
  desc = 'Next type hole'
})
vim.keymap.set('n', '[h', save_and_run(metavars.goto_next), {
  buffer = true,
  desc = 'Previous type hole'
})
vim.keymap.set('n', '<localleader>h', save_and_run(metavars.goto_next), {
  buffer = true,
  desc = 'Show all type holes'
})
