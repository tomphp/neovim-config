return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols, { desc = "Telescope document symbols" })
    vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
    require('telescope').setup{
      pickers = {
        buffers = {
          sort_mru = true,       -- Sort by most recently used
          sort_lastused = true,  -- Put the current buffer at the end (so the 2nd most recent is at the top)
          theme = "dropdown",    -- (Optional) Use a smaller UI similar to a switcher
        }
      }
    }
  end
}
