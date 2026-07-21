return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope find files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope live grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Telescope document symbols",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope help tags",
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      pickers = {
        buffers = {
          sort_mru = true, -- Sort by most recently used
          sort_lastused = true, -- Put the current buffer at the end (so the 2nd most recent is at the top)
          theme = "dropdown", -- (Optional) Use a smaller UI similar to a switcher
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
          },
          n = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
          },
        },
      },
    })
  end,
}
