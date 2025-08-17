return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "bicep", "lua_ls" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "neovim/nvim-lspconfig",
      config = function ()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        require("lspconfig").lua_ls.setup { capabilities = capabilities }
      end
    },
    { "Saghen/blink.cmp" }
  }
}
