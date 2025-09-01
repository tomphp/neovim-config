return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "bicep",
        "c_sharp",
        "c",
        "gitcommit",
        "git_rebase",
        "gitignore",
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
