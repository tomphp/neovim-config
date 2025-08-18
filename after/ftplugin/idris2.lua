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

vim.keymap.set('n', '<localleader>e', save_and_run(repl.evaluate), { desc = 'Evaluate' })

vim.keymap.set('n', '<localleader>os', save_and_run(hover.open_split), { desc = 'Show hovers in a persistent split window, can show full history' })
vim.keymap.set('n', '<localleader>cs', save_and_run(hover.open_split), { desc = 'Show hovers in the default popup' })

vim.keymap.set('n', '<localleader>cs', save_and_run(code_action.case_split), { desc = 'Case splits a name on the LHS, applies with no confirmation' })
vim.keymap.set('n', '<localleader>mc', save_and_run(code_action.make_case), { desc = 'Replaces the metavar with a case block, applies with no confirmation' })
vim.keymap.set('n', '<localleader>mw', save_and_run(code_action.make_with), { desc = 'Replaces the metavar with a with block, applies with no confirmation' })
vim.keymap.set('n', '<localleader>ml', save_and_run(code_action.make_lemma), { desc = 'Replaces the metavar with a top-level lemma, applies with no confirmation' })
vim.keymap.set('n', '<localleader>ac', save_and_run(code_action.add_clause), { desc = 'Add a clause for a declaration, applies with no confirmation' })
vim.keymap.set('n', '<localleader>es', save_and_run(code_action.expr_search), { desc = 'Tries to fill a metavar, produces multiple results' })
vim.keymap.set('n', '<localleader>gd', save_and_run(code_action.generate_def), { desc = 'Tries to build a complete definition for a declaration, produces multiple results' })
vim.keymap.set('n', '<localleader>rh', save_and_run(code_action.refine_hole), { desc = 'Tries to partially fill a metavar with a name' })
vim.keymap.set('n', '<localleader>esh', save_and_run(code_action.expr_search_hints), { desc = 'Same as refine_hole but asks the user for comma-separated names to give as hints' })
vim.keymap.set('n', '<localleader>', save_and_run(code_action.intro), { desc = 'Tries to fill a metavar, with valid constructors, produces multiple results' })

vim.keymap.set('n', '<localleader>nm', save_and_run(metavars.goto_next), { desc = 'Goto next metavar' })
vim.keymap.set('n', '<localleader>pm', save_and_run(metavars.goto_next), { desc = 'Goto previous metavar' })
vim.keymap.set('n', '<localleader>sm', save_and_run(metavars.goto_next), { desc = 'Show all metavars' })
