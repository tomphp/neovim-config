local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to declaration' })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Go to references' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to implementation' })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename symbol' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code actions' })
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { buffer = bufnr, desc = 'Format buffer' })
end

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "bicep", "lua_ls", "powershell_es", "swift-masonlsp" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "neovim/nvim-lspconfig",
      config = function ()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local opts = { capabilities = capabilities, on_attach = on_attach }

        local install_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services"
        require("lspconfig").powershell_es.setup({
          shell = "powershell",
          bundle_path = install_path,
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            powershell = {
              enableProfileLoading = true,
              scriptAnalysis = { enable = true },
            },
          },
        })
      end
    },
    { "Saghen/blink.cmp" }
  }
}
