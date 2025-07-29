return {
  "nvim-treesitter/nvim-treesitter",
  built = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c_sharp", "c", "lua", "vim", "javascript", "python", "typescript"
      },
      sync_install = false,
      highlight = { enabled = true },
      indent = { enabled = true },
    })
  end
}
