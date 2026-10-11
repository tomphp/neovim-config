return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },
  -- Only useful with a Lean toolchain (installed via elan)
  cond = function()
    return require("tomoram.platform").has("lean", "lake")
  end,

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "andymass/vim-matchup",
    -- 'andrewradev/switch.vim',        -- for switch support
    -- 'tomtom/tcomment_vim',           -- for commenting
  },

  -- lean.nvim no longer has a setup() function; it reads vim.g.lean_config
  init = function()
    ---@type lean.Config
    vim.g.lean_config = { -- see the manual for full configuration options
      mappings = true,
    }
  end,
}
