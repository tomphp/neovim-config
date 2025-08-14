return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "bicep" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  }
}
