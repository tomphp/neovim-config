return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  lazy = false,
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bicep",
        "c_sharp",
        "c",
        "haskell",
        "javascript",
        "lua",
        "python",
        "typescript",
        "vim",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
